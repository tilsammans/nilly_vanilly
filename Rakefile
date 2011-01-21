require 'rake'
require 'rake/rdoctask'
require 'jeweler'

Jeweler::Tasks.new do |gem|
  gem.name = "nilly_vanilly"
  gem.homepage = "http://github.com/tilsammans/nilly_vanilly"
  gem.summary = %Q{This plugin stores NULL in your database when you try to store an empty string.}
  gem.email = "joost@spacebabies.nl"
  gem.authors = ["Joost Baaij"]
  gem.add_runtime_dependency 'activerecord', '>= 2'
  gem.add_development_dependency 'rspec', '~> 1.3.1'
  gem.add_development_dependency 'jeweler', '~> 0.5.2'
end
Jeweler::RubygemsDotOrgTasks.new

begin
  # Rspec 1.3.0
  require 'spec/rake/spectask'

  desc 'Default: run specs'
  task :default => :spec
  Spec::Rake::SpecTask.new do |t|
    t.spec_files = FileList["spec/**/*_spec.rb"]
  end

  Spec::Rake::SpecTask.new('rcov') do |t|
    t.spec_files = FileList["spec/**/*_spec.rb"]
    t.rcov = true
    t.rcov_opts = ['--exclude', 'spec']
  end
  
rescue LoadError
  # Rspec 2.0
  require 'rspec/core/rake_task'

  desc 'Default: run specs'
  task :default => :spec  
  Rspec::Core::RakeTask.new do |t|
    t.pattern = "spec/**/*_spec.rb"
  end
  
  Rspec::Core::RakeTask.new('rcov') do |t|
    t.pattern = "spec/**/*_spec.rb"
    t.rcov = true
    t.rcov_opts = ['--exclude', 'spec']
  end

rescue LoadError
  puts "Rspec not available. Install it with: gem install rspec"  
end

desc 'Generate documentation for the nilly_vanilly plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'NillyVanilly'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
