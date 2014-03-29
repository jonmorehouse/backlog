module Backlog
  class Open

    def initialize(args, date)
  
      @date = date

    end

    def execute!

      entry = Entry.new(@date)

      # make sure that the file is created 
      if not entry.exists
        entry.create
      end

      if Date.today == @date.date
        symlink
      end

      # now open the command
      #exec "#{ENV['EDITOR']} #{@date.path}"
      puts @date.path
    end

    def self.help

      return <<-eos
      Open:\tedit backlog entries
      eos

    end

    private
    def symlink
      
      path = File.join(Config.base_dir, "README.md")

      # symlink current entry to readme
      FileUtils.ln_s(@date.path, path, :force => true)

    end

  end
end
