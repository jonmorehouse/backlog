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

    def self.save_date_in_background(date)

      # takes in a date object and saves properly

    end

    def self.save
      Kernel::exec command(commit_message)
    end

    private
    def self.command(message)
      command = "cd #{Config.base_dir} && git add --all . && git commit -a -m \"#{message}\""
    end

    def self.commit_message(date = nil)

      if date == nil
        return Date.today.strftime("%A %B %d")
      else
        date.strftime("%A %B %d")
      end
    end

  end
end
