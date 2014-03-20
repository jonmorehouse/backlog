require 'backlog/args'
require 'backlog/config'
require 'backlog/help'
require 'backlog/open'
require 'backlog/runner'
require 'backlog/tasks'
require 'backlog/datefile'

Backlog::CLI.new(*ARGV).execute!



