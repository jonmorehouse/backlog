module Backlog
  class CLI

    @@commands = {
        init:  Init, 
        help: Help,
        open: Open,
        #:archive => "Archive",

        # following features can come later
        #:todo => "Todo", 
        #:complete => "Complete", 
      }

    @@aliases = {
      
      :init => :in,
      :open => [:o, :edit],
      :help => :h,
      :archive => :a,
      :todo => :t,
      :complete => :c,
    }

    def self.commands

      return @@commands

    end

    def initialize(*argv)
      @args = Args.new(argv)
    end

    def execute!
    
      # get the method to call for this command
      command_class, args = subcommand

      # run the command
      command_class.new(args, @date).execute!

    end

    # return a function pointer for the subcommand
    def subcommand()

      if not @args.length > 0
        return Open, nil
      end
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
        if keyword == key or aliases.include? keyword
          # return the correct command method
          @date = DateFile.new()
          return command_class, @args[1,@args.length] 
        end
      end

      # no command matches up - check to see if this is a date
      # we need to pass the date on to the next step ...
      date = DateFile.new_from_args(@args)

      if date != nil 
        @date = date
        return Open, date.args
      else
        return Open, nil
      end
    end
  end
end
