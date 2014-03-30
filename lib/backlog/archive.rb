require 'chronic'

module Backlog

  class Archive 
  
    def initialize(args, date)
      @args = args
      @date = date
    end

    def execute!
        # our cli parser will always try to guess a legitimate date
        if @date == nil or @date.date == Date.today
          archive_all  
        else 
          archive_path @date.path
        end
    end

    private
    def archive_all
      Dir.glob("#{Config.current_dir}/**md").each do |path|
        date = DateFile.date_from_path(path)
        if date < Date.today
          archive_path(path)
        end
      end
    end

    def archive_path(path)
      filename = File.basename(path)
      FileUtils.mv(path, File.join(Config::archive_dir, filename))
    end
  end
end



