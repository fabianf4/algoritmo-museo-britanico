require './controller.node.rb'
require './node.rb'

#createNewTree()

node1 = Node.new('A') 
node2 = Node.new('E')
node3 = Node.new('C')
node4 = Node.new('D')
node5 = Node.new('E')
node6 = Node.new('F')
node7 = Node.new('E')
node8 = Node.new('H')

#node1
node1.leftChild = node2
node1.leftWeight = 15
node2.leftChild = node3
node2.leftWeight = 10
node2.rightChild = node4
node2.rightWeight = 5
node4.leftChild = node5
node4.leftWeight = 3
node4.rightChild = node6
node4.rightWeight = 2
node1.rightChild = node7
node1.rightWeight = 20
node7.rightChild = node8
node7.rightWeight = 2



#res = addNode(Node.new('B', @firstNode, ), 15)

list,paths,currentCost,optimalCost,optimalPath,numberPath=listBritishMuseumAlgorithmRecursive(node1, "E")

#puts listPreOrderRecursive(node1)
#=begin
paths.each_with_index do |path, index|
    puts "Camino: #{path}, Costo: #{currentCost[index]}, Costo optimo: #{optimalCost[index]}, Camino optimo: #{optimalPath[index]}, Numero de caminos: #{numberPath[index]}"
end
#=end
