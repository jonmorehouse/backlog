require 'chronic'

module Backlog
  class DateFile

    attr_accessor :valid
    attr_accessor :date

    def initialize(date_string = nil)
      
      @string = date_string
      if date_string == nil
        now
      else
        parse_date(date_string)
      end
      
    end

    def self.date_from_path(path)
      
      date_string = File.basename(path).sub!(".md", "").gsub!("-", " ")
      return Date.parse(Chronic.parse(date_string).to_s)
    end

    def self.new_from_argv(argv)

      if argv.length == 0
        return DateFile.new
      end

      # string
      date_string = ""
      date = nil

      # loop through all the string combinations possible
      argv.each do |piece|
      
        date_string = [date_string.split(" ") + [piece]].join " "
        piece_date = DateFile.new date_string

        if piece_date.valid
          date = piece_date
        end
      end

      if date and date.valid
        return date
      else
        return nil
      end
    end

    def filename
      
      code = @date.strftime("%a-%b-%d")
      return "#{code.downcase}.md"
    end

    def argv
      return @argv
    end

    def path
      # determine path
      # if a past date - check to see if the date exists
      # check current/archive
      # generate the correct path as needed
      current_path = File.join Config.current_dir, filename
      archive_path = File.join Config.archive_dir, filename

      # logic to return the correct path
      if @date == Date.today
        return current_path

      elsif @date < Date.today
        
        if File.exist? current_path
          return current_path
        elsif File.exist? archive_path
            return archive_path
        else
            return current_path
        end
      else 
        return current_path
      end
    end

    def relative_path

      # remove the base directory from the path
      return path.sub "#{Config.base_dir}/", ""

    end

    def exists

      # return whether or not the date exists
      return File.exist? path

    end

    private
    def parse_date(date_string)

      # our file names are of the type - mon-mar-16
      # these don't play nice with chronic
      date = Chronic.parse(date_string.sub("-", " "))
      
      # chronic couldn't create a date object from this
      if date == nil
        @valid = nil
        @date = nil
      else
        @valid = true
        @date = Date.parse(date.to_s)
      end
    end

    def now
      @date = Date.parse(Time.now.to_s)
      @valid = true
    end
  end
end


