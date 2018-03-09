require "active_record"
require 'nilly_vanilly/nillify'
require 'nilly_vanilly/inspect'

if defined?(ActiveRecord::Base)
  ActiveRecord::Base.send :include, NillyVanilly::Nillify
end

require "nilly_vanilly/railtie" if defined?(Rails)

module NillyVanilly
end
