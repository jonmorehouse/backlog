module Backlog

  class Save

    def initialize(args = nil, datefile = nil)
    end

    def execute!
      Save.save
    end

    def self.save_in_background

      job = fork do
        Kernel::exec command
      end
      Process.detach job

    end

    def self.save_date_on_open(date)

      # takes in a date object and saves properly
      Kernel::system command(commit_message(date))

    end

    def self.save
      Kernel::exec command(commit_message)
    end

    private
    def self.command(message)
      command = "cd #{Config.base_dir} && git add --all . && git commit -a -m \"#{message}\""
    end

    def self.commit_message(date = nil)

      today = Date.today.strftime("%A %B %d")

      if date == nil or date == Date.today
        return today 
      else
        entry = date.strftime("%A %B %d")
        return "#{entry} (updated on #{today})"
      end
    end

  end
end
