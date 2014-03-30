module Backlog

  class Save

    def initialize(args = nil, datefile = nil)
    end

    def execute!
    end

    def self.save_in_background

      job = fork do
        exec command
      end
      Process.detach job

    end

    def self.save

      exec command

    end

    private
    def command
      command = "git add --all . && git commit -a -m \"#{commit_message}\""
    end

    def commit_message
      return Date.today.strftime("%A %B %d")
    end

  end

end
