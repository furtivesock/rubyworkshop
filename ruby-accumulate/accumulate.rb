class Array
    def accumulate ()
        tab = Array.new
        self.each { |i| tab.push(yield(i)) }
        return tab
    end 
end