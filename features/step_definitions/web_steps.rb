Given(/^I am on the homepage$/) do
  visit '/'
end

When(/^I follow "(.*?)"$/) do |arg1|
  click_link arg1
end

Then(/^I should see "(.*?)"$/) do |arg1|
  page.has_content? arg1  # express the regexp above with the code you wish you had
end

Given(/^I am on the (.+) page$/) do |page|
  visit "/#{page}"
  end

When(/^name is empty$/) do
  @player1==""
end

Then(/^i should see "(.*?)"$/) do |arg2|
  page.has_content? arg2
end

When(/^Two Players are registered$/) do
  @p1 != nil && @p2 != nil
end


Given(/^I am on confo page$/) do
  visit "/confo"
end
