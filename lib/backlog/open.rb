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

      if Date.today == @date.date
        symlink
      end

      # now open the command
      exec "#{ENV['EDITOR']} #{@date.path}"
    end

    def self.help

      return <<-eos
      Open:\tedit backlog entries
      eos

    end

    private
    def symlink
      # symlink current entry to readme
      FileUtils.ln_s(@date.path, File.join(Config.base_dir, "README.md"))

    end

  end
end
