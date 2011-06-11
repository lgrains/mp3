# Read about factories at http://github.com/thoughtbot/factory_girl
require 'faker'

Factory.define :mp3tune do |f|
  f.sequence(:url)    {|n| "www." + n.to_s + Faker::Internet.domain_word + "." + Faker::Internet.domain_suffix}
  f.sequence(:title)  {|n| n.to_s + Faker::Lorem.words(3).join(' ').titleize}
  f.sequence(:artist) {|n| n.to_s + Faker::Name.first_name + " " + Faker::Name.last_name}
  f.sequence(:length) {|n| n + rand(200) + 50} #50 to 250 seconds plus increasing sequence number
end