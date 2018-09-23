module FileDb
  class Table
    :table
    :database

    def initialize(table, database)
      @table = table  
      @database = database
    end

    def select(where: nil)
      ntable = []
      @table.each { |el| 
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
      kept_table = []
      deleted_table = []
      @table.each { |el| 
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
      @table.clear
      kept_table.each { |el| @table << el }
      save
      return deleted_table
    end

    def insert(data)
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
      @table << n_el
      save
      return n_el
    end

    def update(where:, values:)
      updated_tables = []
      @table.each { |el| 
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
      save
      return updated_tables
    end

    def join(from, onlocal, onforeign, join_name = onlocal + "_X_" + onforeign) # left join
      foreign_data = @database.table(from).select
      table_join = []
      @table.each { |el_local| 
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

    def save
      @database.save
    end

  end

end
