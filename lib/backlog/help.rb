module Backlog
  class Help

    def initialize(cli_args, *args)

    end

    def execute!

      menu = "Version: #{VERSION}" 
      puts "#{menu}\n#{(0..menu.length).map{"-"}.join}"

      # run the command as needed
      CLI.commands.each do |command, command_class| 
        
        print_help command_class

      end
    end

    def self.help()

  return <<-eos
  Help: Print this menu
  eos

    end

    def print_help(command_class)

      if defined? command_class.help

        help = command_class.help
        puts help
      end

    end

  end
end
