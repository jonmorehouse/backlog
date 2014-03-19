require 'backlog'

Then(/^it should not be a valid datefile$/) do
  @datefile.valid.should == nil
end

When(/^I create a datefile with no date_string$/) do
  @datefile = Backlog::DateFile.new
end

Then(/^it should be today's date$/) do
  @datefile.date.should == Date.today
end

Then(/^it should be a valid datefile$/) do
  @datefile.valid.should_not == nil
end

Given(/^I set the date string to "(.*?)"$/) do |date_string|
  @date_string = date_string
end

When(/^I create a date object$/) do
  @datefile = Backlog::DateFile.new @date_string
end

Then(/^it should be a current file$/) do
  File.dirname(@datefile.path).should == Backlog::Config.current_dir
end

Then(/^it should be an archive file$/) do
  File.dirname(@datefile.path).should == Backlog::Config.archive_dir
end



