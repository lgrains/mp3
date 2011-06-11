# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :rating do |f|
  f.association :mp3tune, :factory => :mp3tune
  f.value rand(4)+1
end