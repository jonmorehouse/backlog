require 'fileutils'
require 'aruba/cucumber'
require 'backlog'

lib_dir = File.expand_path('../../../lib', __FILE__)

Before do
 
  @dirs = ["tmp"]
  # have bin/hub load code from the current project
  set_env 'RUBYLIB', lib_dir
  # initialize backlog file
  set_env "BACKLOG_DIR", "backlog"
  # we are using editor to open files
  set_env "EDITOR", "echo"

end

After do
  

end

Aruba.configure do |config|

end
