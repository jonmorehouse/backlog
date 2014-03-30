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
     
      File.open(@path, "w").write content
      
    end

    private
    def title

      return @date.date.strftime("%A %B %d")
    end

    def content
      return <<-eos
#{title} 
#{(0..title.length).map{"="}.join}

Completed
---------




Todo
----




      eos
    end


  end
end
