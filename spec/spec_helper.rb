$LOAD_PATH << "." unless $LOAD_PATH.include?(".")

require 'yaml'
require File.dirname(__FILE__) + '/../rails/init.rb'

ENV['DB'] ||= 'sqlite3'

database_yml = File.expand_path('../database.yml', __FILE__)
if File.exists?(database_yml)
  active_record_configuration = YAML.load_file(database_yml)[ENV['DB']]
  
  ActiveRecord::Base.establish_connection(active_record_configuration)
  ActiveRecord::Base.logger = Logger.new(File.join(File.dirname(__FILE__), "debug.log"))
  
  ActiveRecord::Base.silence do
    ActiveRecord::Migration.verbose = false
    
    load(File.dirname(__FILE__) + '/schema.rb')
    load(File.dirname(__FILE__) + '/models.rb')
  end  
  
else
  raise "Please create #{database_yml} first to configure your database. Take a look at: #{database_yml}.sample"
end

def clean_database!
  [Post, Comment].each do |model|
    ActiveRecord::Base.connection.execute "DELETE FROM #{model.table_name}"
  end
end

clean_database!