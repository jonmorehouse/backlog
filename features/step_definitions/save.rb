Given(/^the directory is a git repository$/) do
end

Then(/^project should be committed to git with proper message$/) do
  command = "cd #{Backlog::Config.base_dir} && git add --all . && git commit -a -m \"#{Date.today.strftime("%A %B %d")}\""
  @exec_spy.has_been_called?.should == true
  @exec_spy.has_been_called_with?(command).should == true
end

Then(/^"(.*?)" is saved$/) do |date_string|

  date = date_from_date_string(date_string)

  today = Date.today.strftime("%A %B %d")
  if date.strftime("%A %B %d") == today
    commit_message = today 
  else
    entry = date.strftime("%A %B %d")
    commit_message = "#{entry} (updated on #{today})"
  end

  command = "cd #{Backlog::Config.base_dir} && git add --all . && git commit -a -m \"#{commit_message}\""
  @system_spy.has_been_called?.should == true
  @system_spy.has_been_called_with?(command).should == true

end
