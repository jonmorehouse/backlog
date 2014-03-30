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

    def self.save

      Kernel::exec command

    end

    private
    def self.command
      command = "cd #{Config.base_dir} && git add --all . && git commit -a -m \"#{commit_message}\""
    end

    def self.commit_message
      return Date.today.strftime("%A %B %d")
    end

  end

end
