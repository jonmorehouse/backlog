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

        if ENV['BACKLOG_DIR'].start_with? "/" or ENV['BACKLOG_DIR'].start_with? "~/" or ENV['BACKLOG_DIR'].start_with? "$HOME"
          @@path = ENV['BACKLOG_DIR']
        else
          @@path = File.join(ENV['HOME'], ENV['BACKLOG_DIR'])
        end
      else
        @@path = File.join(ENV['HOME'], ".backlog")
      end
      @@path = File.expand_path @@path
    end

    def self.current_dir
      return File.join(Config.base_dir, "current")
    end

    def self.archive_dir
      return File.join(Config.base_dir, "archive")
    end

    def self.entry_path
      custom_entry_path = File.join(ENV['HOME'], ".personal_backlog.md")
      if File.file?(custom_entry_path)
        return custom_entry_path
      end

      return File.join(Config.base_dir, "template.md")
    end
  end
end
