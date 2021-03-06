require 'fileutils'
require 'aruba/cucumber'
require 'aruba'
require 'aruba/in_process'
require 'backlog'
require 'spy'
require 'chronic'

lib_dir = File.expand_path('../../../lib', __FILE__)
aruba_dir = nil

def date_from_date_string(date_string)
   return Chronic.parse(date_string)
end

def filename_from_date_string(date_string)
  return "#{date_from_date_string(date_string).strftime("%a-%b-%d").downcase}.md"
end

def path_from_date_string(date_string)
  path = File.join(Backlog::Config.current_dir, filename_from_date_string(date_string))
end

# cucumber before / after hooks
Before do
  @dirs = ["tmp"]

  aruba_dir = File.join Dir.pwd, "tmp"
  # have bin/hub load code from the current project
  set_env 'RUBYLIB', lib_dir
  # initialize backlog file
  set_env "BACKLOG_DIR", "backlog"
  set_env "HOME", aruba_dir
end

Before ('@stubbed') do
  @exec_spy = Spy.on(Kernel, :exec).and_return 0
  @system_spy = Spy.on(Kernel, :system).and_return 0
end

After ('@stubbed') do
  Spy.off(Kernel, :exec)
  Spy.off(Kernel, :system)
end

After do
  
end

at_exit do
  if aruba_dir and File.directory?(aruba_dir)
    FileUtils.rm_rf aruba_dir
  end
end

# aruba specific
Aruba::InProcess.main_class = Backlog::CLI
Aruba.process = Aruba::InProcess
