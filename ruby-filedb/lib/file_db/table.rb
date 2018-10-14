module FileDb
  class Table

    def initialize(database, name, data_file)
      @database = database
      @name = name  
      @file = data_file
    end

    def select(where: nil)
      tables = nil
      File.open(@file, "r") { |file|
        file.flock(File::LOCK_SH)
        tables = JSON.parse(file.read)
        file.flock(File::LOCK_UN)
      }
      table = tables[@name]
      ntable = []
      table.each { |el| 
        pass = true
        if where != nil
          where.keys.each { |k|
            if where[k] != el[k.to_s()]
              pass = false
              break
            end 
          }
        end
        if pass
          ntable << el.clone
        end
      }
      return ntable
    end

    def delete(where: nil)
      tables = nil
      File.open(@file, "r") { |file|
        file.flock(File::LOCK_EX)
        tables = JSON.parse(file.read)
      }
      table = tables[@name]

      kept_table = []
      deleted_table = []
      table.each { |el| 
        pass = true
        if where != nil
          where.keys.each { |k|
            if where[k] != el[k.to_s()]
              pass = false
              break
            end 
          }
        end
        if not pass
          kept_table << el.clone
        else
          deleted_table << el.clone
        end
      }
      table.clear
      kept_table.each { |el| table << el }
      File.open(@file, "w") { |file|
        file << JSON.pretty_generate(tables)
        file.flock(File::LOCK_UN)
      }
      return deleted_table
    end

    def insert(data)
      tables = nil
      File.open(@file, "r") { |file|
        file.flock(File::LOCK_EX)
        tables = JSON.parse(file.read)
      }
      table = tables[@name]

      rows = select()
      max_id = -1
      rows.each { |el| 
        if el["id"] > max_id
          max_id = el["id"]
        end 
      }
      n_el = Hash.new()
      n_el["id"] = max_id + 1
      data.each { |k,v| n_el[k.to_s] = v }
      table << n_el
      File.open(@file, "w") { |file|
        file << JSON.pretty_generate(tables)
        file.flock(File::LOCK_UN)
      }
      return n_el
    end

    def update(where:, values:)
      tables = nil
      File.open(@file, "r") { |file|
        file.flock(File::LOCK_EX)
        tables = JSON.parse(file.read)
      }
      table = tables[@name]

      updated_tables = []
      table.each { |el| 
        pass = true
        if where != nil
          where.keys.each { |k|
            if where[k] != el[k.to_s()]
              pass = false
              break
            end 
          }
        end
        if pass
          values.keys.each { |k|
            el[k.to_s] = values[k]
          }
          updated_tables << el.clone
        end
      }
      File.open(@file, "w") { |file|
        file << JSON.pretty_generate(tables)
        file.flock(File::LOCK_UN)
      }
      return updated_tables
    end

    def join(from, onlocal, onforeign, join_name = onlocal + "_X_" + onforeign) # left join
      tables = nil
      File.open(@file, "r") { |file|
        file.flock(File::LOCK_SH)
        tables = JSON.parse(file.read)
        file.flock(File::LOCK_UN)
      }
      table = tables[@name]
      foreign_data = @database.table(from).select
      table_join = []
      table.each { |el_local| 
        hash_join = []
        foreign_data.each { |el_foreign| 
          if el_local[onlocal] == el_foreign[onforeign]
            hash_join << el_foreign.clone
          end
        }
        el_add = el_local.clone
        el_add[join_name] = hash_join
        table_join << el_add
      }
      return table_join
    end

  end

end