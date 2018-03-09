require 'sqlite3'
require 'yaml'

ENV['DB'] ||= 'sqlite3'

database_yml = File.expand_path('../../db/database.yml', __FILE__)
if File.exists?(database_yml)
  active_record_configuration = YAML.load_file(database_yml)[ENV['DB']]

  ActiveRecord::Base.establish_connection(active_record_configuration)
  ActiveRecord::Base.logger = Logger.new(File.join(File.dirname(__FILE__), "../debug.log"))

  load(File.dirname(__FILE__) + '/../db/schema.rb')
  load(File.dirname(__FILE__) + '/../db/models.rb')

else
  raise "Please create #{database_yml} first to configure your database. Take a look at: #{database_yml}.example"
end

def clean_database!
  [Post, Comment].each do |model|
    ActiveRecord::Base.connection.execute "DELETE FROM #{model.table_name}"
  end
end

clean_database!
