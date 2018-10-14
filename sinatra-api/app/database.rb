require 'json'

require_relative 'table.rb'

module FileDb
  class Database
    :file
    :tables

    def initialize(data_file)
      @file = data_file
      @tables = JSON.parse(File.read(@file));
    end

    def table_names
      return @tables.keys.sort
    end

    def table(name)
      return Table.new(@tables[name], self)
    end

    def save
      File.open(@file, 'w') { |file|
        file << JSON.pretty_generate(@tables)
      }
    end
  end
end
