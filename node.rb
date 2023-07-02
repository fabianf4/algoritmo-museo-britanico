class Node
    attr_accessor :data, :father, :leftChild, :leftWeight, :rightChild, :rightWeight

    def initialize(data = nil, father = nil, leftChild = nil, 
                    leftWeight = nil, rightChild = nil, rightWeight = nil)
        @data = data
        @father = father
        @leftChild = leftChild
        @leftWeight = leftWeight

        @rightChild = rightChild
        @rightWeight = rightWeight
    end

    def isFirsNode()
        return @father.nil? 
    end
end
