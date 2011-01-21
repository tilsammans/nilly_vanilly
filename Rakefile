require 'rake'
require 'rake/rdoctask'

desc 'Default: run specs.'
task :default => :spec

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
