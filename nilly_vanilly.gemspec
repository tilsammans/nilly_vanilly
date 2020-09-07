# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "nilly_vanilly/version"

Gem::Specification.new do |s|
  s.name        = "nilly_vanilly"
  s.version     = NillyVanilly::VERSION
  s.authors     = ["Joost Baaij"]
  s.email       = ["joost@spacebabies.nl"]

  s.homepage    = "https://github.com/tilsammans/nilly_vanilly"
  s.summary     = %q{This plugin stores NULL in your database when you try to store an empty string.}
  s.description = %q{This plugin stores NULL in your database when you try to store an empty string.}
  s.license     = 'MIT'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'activerecord', '>= 5.2.4.3'

  s.add_development_dependency 'rake', '>= 12.3.3'
  s.add_development_dependency 'rspec', '~> 3.7'
  s.add_development_dependency 'sqlite3', '~> 1.4'
end
