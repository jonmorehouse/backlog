module Backlog
  class Entry
    def initialize(date)
      @date = date
      @path = date.path
      if not File.exists?(date.path)
        @exists = nil
      else
        @exists = true
      end

    end

    def exists
      return @exists
    end

    def create
      File.open(@path, "w") do |f|
        f.write content
      end
      
    end

    private
    def title
      return @date.date.strftime("%A %B %d")
    end

    def content
      content = File.open(Config.template_path, "r").read()
      content.gsub!("%title%", title)
    end

  end
end
