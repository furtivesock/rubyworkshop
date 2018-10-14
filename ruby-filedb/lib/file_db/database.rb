require 'json'

module FileDb
  class Database

    def initialize(data_file)
      if not File.exist?(data_file) 
        raise IOError
      end
      @file = data_file
    end

    def table_names
      tables = JSON.parse(File.read(@file))
      return tables.keys.sort
    end

    def table(name)
      if not table_names.include?(name)
        return nil
      else
        return Table.new(self, name, @file)
      end
    end

  end
end
