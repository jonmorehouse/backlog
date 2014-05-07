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
      return <<-eos
# #{title} 

## Completed




## Todo


      eos
    end


  end
end
