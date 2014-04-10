module Backlog
  class Open

    def initialize(args, date)

      if not date
        puts "Invalid date file"
        return
      end
  
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

      # save date as needed
      Save.save_date_on_open(@date.date)

      # open file
      Kernel::exec "cd #{Config.base_dir} && #{ENV['EDITOR']} #{@date.relative_path}"
    end

    def self.help

  return <<-eos
  Open:\tedit backlog entries
  eos

    end

    private
    def symlink
      
      Dir.chdir Config.base_dir do
        # symlink current entry to readme
        FileUtils.ln_s(@date.relative_path, "README.md", :force => true)
      end
    end

  end
end
