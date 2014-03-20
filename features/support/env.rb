require 'aruba/cucumber'
require 'backlog'

lib_dir = File.expand_path('../../../lib', __FILE__)

Before do
 
  # have bin/hub load code from the current project
  set_env 'RUBYLIB', lib_dir
  # speed up load time by skipping RubyGems
  set_env 'RUBYOPT', '--disable-gems' if RUBY_VERSION > '1.9'
  # initialize backlog file
  set_env "BACKLOG_DIR", File.join("tmp", "backlog")

end

After do

end

Aruba.configure do |config|
   
end
