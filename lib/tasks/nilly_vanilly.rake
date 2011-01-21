namespace :nilly do
  namespace :vanilly do
    task :inspect => :environment do
      NillyVanilly::Inspect.print
    end
  end
end