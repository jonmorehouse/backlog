module Backlog
  class Help

    def initialize(cli_args, *args)

    end

    def execute!

      # run the command as needed
      CLI.commands.each do |command, command_class| 
        #puts command_class
        puts command
        ##print_help(command_class)

      end

    end

    def self.help()

      return <<-eos
      Help: \tPrint this menu
      eos

    end

    def print_help(command_class)

      help = command_class.help
      puts help

    end

  end
end
