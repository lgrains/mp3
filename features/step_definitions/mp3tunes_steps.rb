

Given /^the following mp3tunes exist:$/ do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |hash|
    mp3tune = Factory(:mp3tune, hash)
  end
end

When /^I follow "([^"]*)" for "([^"]*)"$/ do |link_title, mp3_title|
  mp3 = Mp3tune.find_by_title(mp3_title)
  When %{I follow "#{link_title}" within ".mp3tune_#{mp3.id}"}
end


Then /^I should see all my mp3tunes$/ do
  tunes = Mp3tune.all
  tunes.each do |t|
    Then %{I should see "#{t.url}"}
    Then %{I should see "#{t.title}"}
    Then %{I should see "#{t.artist}"}
    Then %{I should see "#{t.length}"}
  end
end

Then /^a new Mp3tune should be created in the database with title "([^"]*)"$/ do |title|
  mp3 = Mp3tune.find_by_title(title)
  mp3.should_not be_nil
end

Then /^I should see the items "([^"]*)"$/ do |list|
  list.split(',').each do |item|
    Then %{I should see "#{item}"}
  end
end

Then /^the Mp3tune with title "([^"]*)" is not in the database$/ do |title|
  mp3 = Mp3tune.find_by_title(title)
  mp3.should be_nil
end



