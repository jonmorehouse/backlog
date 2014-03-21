require 'fileutils'

module Backlog
  class Init
  
    def initialize(*args)

    end

    def execute!
      
      [Config.base_dir, Config.archive_dir, Config.current_dir].each do |directory|

        if not File.directory? directory 
          FileUtils.mkdir(directory)
        end
      end
    end

    def self.help()
      return <<-eos
      Init:\tInitialize the backlog directory with the correct directory structures (ie: current/archive)
      eos
    end

  end
end

