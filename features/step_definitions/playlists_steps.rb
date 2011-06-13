Given /^the mp3tunes have the following ratings:$/ do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |hash|
    tune = Mp3tune.find_by_title(hash[:title])
    Factory(:rating, :mp3tune => tune, :value => hash[:rating])
  end
end

Then /^the first line in the playlist should be "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^I should (not )?see the lines "([^"]*)" in the playlist$/ do |negatory, list|
  list.split(';').each do |line|
    if negatory
      Then %{I should not see "#{line}"}
    else
      Then %{I should see "#{line}"}
    end
  end
end
