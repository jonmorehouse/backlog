module Backlog
  class CLI

    @@commands = {
        :init => "Init", 
        :open => "Open",
        :archive => "Archive",

        # following features can come later
        :todo => "Todo", 
        :complete => "Complete", 
      }

    @@aliases = {
      
      :init => :in,
      :open => [:o, :edit],
      :archive => :a,
      :todo => :t,
      :complete => :c,
    }

    def initialize(*argv)
      @args = Args.new(argv)
    end

    def execute!
    
      # get the method to call for this command
      command, args = subcommand

      puts command

    end

    # return a function pointer for the subcommand
    def subcommand()

      # split the argv into a list of command words passed
      # cache the first string a symbol
      keyword = @args[0].to_sym
      
      # loop through all commands and see if we have a match
      @@commands.each do |key, command_class|

        # grab a list of the aliases
        aliases = nil
        # check to see if aliases key exists
        if @@aliases.has_key?(key)

          # grab the key and then fill the aliases hash properly
          value = @@aliases[key] 
          if value.kind_of?(Symbol)
            aliases = [value]
          else
            aliases = value
          end
        end
        
        # if alias / keywords match up then go ahead and return the correct class
        if keyword == key or aliases.include? key
          # return the correct command method
          return command_class, @args[1,@args.length] 
        end
      end

      # no command matches up - check to see if this is a date
      date = DateFile.new_from_args(@args)

      if date != nil 
        return Open, date.args
      else
        return Help, @args
      end
    end
  end
end
