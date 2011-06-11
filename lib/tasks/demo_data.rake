require 'faker'

namespace :db do
  desc "Create demo data"

  task :populate => [:environment, :seed] do

    #require the factories
    Dir[Rails.root.join("spec/factories/*.rb")].each {|f| require f}

    #configuration values:
    num_tunes     =20
    num_ratings_per_tune = 39

    #create tunes
    num_tunes.times do
      tune = Factory(:mp3tune)
      num_ratings_per_tune.times do
        Factory(:rating, :mp3tune => tune)
      end
    end
  end
end