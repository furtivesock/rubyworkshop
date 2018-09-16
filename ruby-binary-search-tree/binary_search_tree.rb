class Bst
    VERSION = 1
    
    attr_reader :value
    attr_accessor :left
    attr_accessor :right

    def initialize(value)
        @value = value
    end

    def data
        return @value
    end

    def each (&block)
        sorted = Array.new
        stack = Array.new
        node = self
        while not stack.empty? or node != nil
            if node != nil
                stack << node
                node = node.left
            else
                node = stack.pop
                sorted << node.data
                node = node.right
            end
        end 

        if block == nil 
            enumerator = Enumerator.new { |yielder|
                sorted.each { |e| yielder << e }
            }
            return enumerator
        else
            sorted.each { |e| block.call e }
        end
    end

    def insert(value)
        bst = self
        loop do
            if value > bst.data
                if bst.right == nil
                    bst.right = Bst.new value
                    break
                else
                    bst = bst.right
                end
            else
                if bst.left == nil
                    bst.left = Bst.new value
                    break
                else
                    bst = bst.left
                end
            end
        end
    end
end
