def git_push_command 
  "cd #{Backlog::Config.base_dir} && git push --force"
end

Then(/^the git repository should be pushed$/) do
  
  @system_spy.has_been_called_with?(git_push_command) == false

end

Then(/^the git repository should not be pushed$/) do
  
  @system_spy.has_been_called_with?(git_push_command) == true

end
