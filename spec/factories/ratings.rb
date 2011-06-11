# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :rating do |f|
  f.association :mp3tune, :factory => :mp3tune
  f.sequence(:value) {|n| rand(n) % 5 + 1}
end