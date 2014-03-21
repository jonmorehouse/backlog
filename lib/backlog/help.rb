module Backlog
  class Help

    def initialize(cli_args, *args)


    end

    def execute!

      # run the command as needed
      CLI.commands.each do |command, command_class| 

        print_help(command_class)

      end

    end

    def print_help(command_class)

      help = command_class.help
      puts help

    end

  end
end
