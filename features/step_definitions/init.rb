require 'fileutils'
Given(/^default backlog directory exists$/) do

  if not File.directory? Backlog::Config.base_dir
    FileUtils.mkdir(Backlog::Config.base_dir)
  end
end

Given(/^default backlog directory does not exist$/) do

  if File.directory? Backlog::Config.base_dir

    FileUtils.rm_f(Backlog::Config.base_dir)
  end
end


Then(/^backlog directory should exist$/) do
  
  [Backlog::Config.base_dir, Backlog::Config.current_dir, Backlog::Config.archive_dir].each do |directory|
    
    #File.directory?(directory).should == true
  end
end

