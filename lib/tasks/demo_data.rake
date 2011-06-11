require 'faker'

namespace :db do
  desc "Create demo data"

  task :populate => [:environment, :seed] do

    #require the factories
    Dir[Rails.root.join("spec/factories/*.rb")].each {|f| require f}

    #configuration values:
    num_tunes = 20

    #create tunes
    num_tunes.times do
      tune = Factory(:mp3tune)
      num_tunes_per_artist = rand(10)
      #puts num_tunes_per_artist
      (num_tunes_per_artist - 1).times  do
        tune_a  = Factory(:mp3tune, :artist => tune.artist)
        num_ratings_per_tune = rand(20)
        num_ratings_per_tune.times do
          Factory(:rating, :mp3tune => tune_a)
        end
      end
      num_ratings_per_tune = rand(20)
      num_ratings_per_tune.times do
        Factory(:rating, :mp3tune => tune)
      end
    end
  end
end