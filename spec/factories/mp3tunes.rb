# Read about factories at http://github.com/thoughtbot/factory_girl
require 'faker'

Factory.define :mp3tune do |f|
  f.title             Faker::Lorem.words(3).join(' ').titleize
  f.artist            Random.firstname + " " + Random.lastname
  f.length            rand(200) + 50 #50 to 250 seconds
  f.sequence(:url)    {|n| "www." + n.to_s + Faker::Internet.domain_word + "." + Faker::Internet.domain_suffix}

end