Then(/^today's entry should be opened$/) do

    today = Date.today.strftime("%a-%b-%d").downcase
    path = File.join(Backlog::Config.base_dir, "current", "#{today}.md")
    #step "the stdout from \"backlog\" should contain exactly \"#{path}\\n\""

end
