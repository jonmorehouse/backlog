module Backlog
  class Open

    def initialize(args, date = nil)

      # grab the date path
      if date == nil
          @date = DateFile.new
      else
        @date = date
      end

    end

    def execute!

      entry = Entry.new(@date)
      # make sure that the file is created 
      if not entry.exists
        entry.create
      end

      # now open the command
    end

    def self.help

      return <<-eos
      Open:\tedit backlog entries
      eos

    end

    private
    def symlink


    end



  end
end
