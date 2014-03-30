module Backlog

  class Push

    def initialize(args, date)
      # determine whether or not this is pushable
      @pushable = remote_set
    end

    def execute!
      if @pushable
        push
      end
    end

    def self.help

  return <<-eos
  Push:\tPush current backlog to git
  eos

    end
    private
    def remote_set
      command = "cd #{Config.base_dir} && git remote show origin 2>&1 1>/dev/null"
      return Kernel::system command
    end

    def push
      command = "cd #{Config.base_dir} && git push --force"
      Kernel::system command
    end
  end

end
