Given(/^the directory is a git repository$/) do
end

Then(/^project should be committed to git with proper message$/) do
  command = "cd #{Backlog::Config.base_dir} && git add --all . && git commit -a -m \"#{Date.today.strftime("%A %B %d")}\""
  @exec_spy.has_been_called?.should == true
  puts command

end

