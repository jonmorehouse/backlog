require 'fileutils'
require 'aruba/cucumber'
require 'aruba'
require 'aruba/in_process'
require 'backlog'
require 'spy'

lib_dir = File.expand_path('../../../lib', __FILE__)

Before do
 
  @dirs = ["tmp"]
  # have bin/hub load code from the current project
  set_env 'RUBYLIB', lib_dir
  # initialize backlog file
  set_env "BACKLOG_DIR", "backlog"
  set_env "HOME", File.join(Dir.pwd, "tmp")

end

Before ('@stubbed') do
  Spy.on(Kernel, :exec).and_return 0
end

After ('@stubbed') do

  Spy.off(Kernel, :exec)

end


Aruba::InProcess.main_class = Backlog::CLI
Aruba.process = Aruba::InProcess

Aruba.configure do |config|
  
end
