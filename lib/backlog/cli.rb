module Backlog
  class CLI

    @@commands = {
        init:  Init, 
        help: Help,
        open: Open,
        archive: Archive,
        save: Save,
        # following features can come later
        #:todo => "Todo", 
        #:complete => "Complete", 
      }

    @@aliases = {
      
      :init => :in,
      :open => [:o, :edit],
      :help => :h,
      :archive => :a,
      #:todo => :t,
      :save => :s,
      #:complete => :c,
    }

    def self.commands

      return @@commands

    end

    def initialize(argv, stdin=STDIN, stdout=STDOUT, stderr=STDERR, kernel=Kernel)

      @argv, @stdin, @stdout, @stderr, @kernel = argv, stdin, stdout, stderr, kernel
    end

    def execute!

      # get the method to call for this command
      command_class, argv = subcommand

      # run the command
      command_class.new(argv, @datefile).execute!

    end

    # return a function pointer for the subcommand
    def subcommand()

      if not @argv.length > 0
        @datefile = DateFile.new
        return Open, nil
      end
      # cache the first string a symbol
      keyword = @argv[0].to_sym
      
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
          @datefile = DateFile.new_from_argv(@argv)
          return command_class, @argv[1,@argv.length] 
        end
      end

      # no command matches up - check to see if this is a date
      # we need to pass the date on to the next step ...
      date = DateFile.new_from_argv(@argv)

      if date != nil 
        @datefile = date
        return Open, date.argv
      else
        @datefile = DateFile.new
        return Open, nil
      end
    end
  end
end
