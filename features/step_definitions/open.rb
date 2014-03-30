Then(/^"(.*?)" should be opened$/) do |date_string|
  path = File.join "current", filename_from_date_string(date_string)
  command = "cd #{Backlog::Config::base_dir} && #{ENV['EDITOR']} #{path}"

  @exec_spy.has_been_called?.should == true
  @exec_spy.has_been_called_with?(command).should == true
end

Then(/^"(.*?)" should be a backlog entry$/) do |date_string|
  path = path_from_date_string(date_string)
  File.exists?(path).should == true
end


