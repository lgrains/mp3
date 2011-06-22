Given /^mp3tune "([^"]*)" has a ratings value of (\d+)$/ do |title , value|
  mp3 = Mp3tune.find_by_title(title)
  Factory(:rating, :mp3tune => mp3, :value => value)
end

Given /^mp3tune "([^"]*)" has ratings with values "([^"]*)"$/ do |title, list|
  list.split(',').each do |value|
    Factory(:rating, :mp3tune => Mp3tune.find_by_title(title), :value => value)
  end
end

Given /^the following ratings exist:$/ do |table|
  table.hashes.each do |hash|
    Factory(:rating, :mp3tune => Mp3tune.find_by_title(hash[:title]), :value => hash[:value])
  end
end




