module Backlog

  attr_accessor :base_dir

  class Config

    # internal variables
    @@path = nil

    def self.base_dir
      if @@path != nil 
        return @@path
      end
      if ENV.has_key? "BACKLOG_DIR"
        @@path = File.expand_path(ENV['BACKLOG_DIR'])
      else
        @@path = File.join(ENV['HOME'], ".backlog")
      end
    end

    def self.current_dir
      return File.join(Config.base_dir, "current")
    end

    def self.archive_dir
      return File.join(Config.base_dir, "archive")
    end

  end
end
