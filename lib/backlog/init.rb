require 'fileutils'

module Backlog
  class Init
  
    def initialize(*args)

    end

    def execute!
      
      create_directories
      initialize_git
    end

    def self.help()
      return <<-eos
      Init:\tInitialize the backlog directory with the correct directory structures (ie: current/archive)
      eos
    end

    private
    def create_directories
      [Config.base_dir, Config.archive_dir, Config.current_dir].each do |directory|
        if not File.directory? directory 
          FileUtils.mkdir(directory)
        end
      end
    end

    def initialize_git
      git_directory = File.join Config.base_dir, ".git"
      if not File.directory? git_directory
        system "cd #{Config.base_dir} && git init"
      end
    end

  end
end

