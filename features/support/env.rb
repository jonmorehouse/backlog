require 'aruba/cucumber'

Before do
  
  @dirs = ["tmp"]
  ENV['BACKLOG_DIR'] = File.join("tmp", "backlog")
  #FileUtils.mkdir = 
  puts ENV['BACKLOG_DIR']

end

Aruba.configure do |config|

  #ENV['BACKLOG_DIR'] = Dir.join(ENV['HOME'], ".backlog")

  puts ENV['HOME']

end
