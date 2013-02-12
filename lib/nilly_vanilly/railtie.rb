module NillyVanilly
  class Railtie < Rails::Railtie
    rake_tasks do
      load File.dirname(__FILE__) + "/../tasks/nilly_vanilly.rake"
    end
  end
end
