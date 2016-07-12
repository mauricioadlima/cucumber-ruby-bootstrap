Given(/^I'm on the page "([^"]*)"$/) do |page|
  visit page
end

And(/^formulary was cleaned$/) do
  click_button "Clean"
end

Given(/^a user with name "([^"]*)"$/) do |value|
  fill_in "name", :with => value
end

Given(/^email "([^"]*)"$/) do |value|
  fill_in "email", :with => value
end

Given(/^phone "([^"]*)"$/) do |value|
  fill_in "phone", :with => value
end

Given(/^gender "([^"]*)"$/) do |value|
  select value, :from => "gender"
end

When(/^I click in save button$/) do
  click_button "Save"
end

Then(/^message should be "([^"]*)"$/) do |msg|
  expect(msg).to eql page.driver.browser.switch_to.alert.text
end

And(/^if I click on OK option$/) do
  accept_alert
end

Given(/^a list of users$/) do |table|
  row = table.raw.sample
  steps %Q{
    Given a user with name "#{row[0]}"
      And email "#{row[1]}"
      And phone "#{row[2]}"
      And gender "#{row[3]}"
  }
end

Then(/^I save the user$/) do
  steps %Q{
      When I click in save button
      Then message should be "Are you sure?"
       And if I click on OK option
      Then message should be "Saved with successfully!"
  }
end
