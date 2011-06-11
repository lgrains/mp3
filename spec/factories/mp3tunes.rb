# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :mp3tune do |f|
  f.sequence(:url)    {|n| "www." + n.to_s + Faker::Internet.domain_word + "." + Faker::Internet.domain_suffix}
  f.title Faker::Lorem.words(3)
  f.artist Faker::Name.first_name + " " + Faker::Name.last_name
  f.length rand(200) + 50 #50 to 250 seconds
end