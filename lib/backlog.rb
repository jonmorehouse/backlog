require 'backlog/args'
require 'backlog/config'
require 'backlog/help'
require 'backlog/entry'
require 'backlog/init'
require 'backlog/open'
require 'backlog/runner'
require 'backlog/tasks'
require 'backlog/datefile'

Backlog::CLI.new(*ARGV)

