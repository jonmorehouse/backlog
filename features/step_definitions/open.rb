require 'spy'
require 'chronic'

def get_path(date_string)
  date = Chronic.parse(date_string)
  filename = "#{date.strftime("%a-%b-%d").downcase}.md"
  path = File.join(Backlog::Config.current_dir, filename)
end

Then(/^"(.*?)" should be opened$/) do |date_string|
  path = get_path(date_string)
end

Then(/^"(.*?)" should be a backlog entry$/) do |date_string|
  path = get_path(date_string)
  File.exists?(path).should == true
end







