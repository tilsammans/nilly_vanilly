require "active_record"
require 'nilly_vanilly/nillify'

if defined?(ActiveRecord::Base)
  ActiveRecord::Base.send :include, NillyVanilly::Nillify
end
