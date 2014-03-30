def archive_path(date_string)
  filename = filename_from_date_string(date_string)
  return File.join(Backlog::Config.archive_dir, filename)
end

Given(/^entry for "(.*?)" exists$/) do |date_string|
  path = path_from_date_string(date_string)
  FileUtils.touch path
end


Then(/^entry for "(.*?)" should be archived$/) do |date_string|
  File.exists?(archive_path(date_string)).should == true
  File.exists?(path_from_date_string(date_string)).should == false
end

Then(/^entry for "(.*?)" should not be archived$/) do |date_string|
    File.exists?(archive_path(date_string)).should == false
    File.exists?(path_from_date_string(date_string)).should == true
end
