require './node.rb'

def createNewTree()
    @firstNode = Node.new()
end

#position true=left false=right
def addNode(newNode, weightNode, position = true)
    if position
        if newNode.father.leftChild.nil?
            newNode.father.leftChild = newNode
            return true
        else
            return false
        end
    else
        if newNode.father.leftChild.nil?
            newNode.father.rightChild = newNode
            return true
        else
            return false
        end
    end
end

def listForHeightRecursive(node, list="")
    list += node.data

    if node.leftChild.nil? and node.rightChild.nil?
        return list
    end

    if !node.leftChild.nil?
        list = listForHeightRecursive(node.leftChild, list)
    end

    list += node.data

    if !node.rightChild.nil?
        list = listForHeightRecursive(node.rightChild, list)
    end

    return list
end

def listPreOrderRecursive(node, list="")
    list += node.data

    if node.leftChild.nil? and node.rightChild.nil?
        return list
    end

    if !node.leftChild.nil?
        list = listPreOrderRecursive(node.leftChild, list)
    end

    if !node.rightChild.nil?
        list = listPreOrderRecursive(node.rightChild, list)
    end

    return list
end

def listBritishMuseumAlgorithmRecursive(node, nodeFData, list="",paths = [], currentCostLast = 0, currentCost = [] , optimalCost = [], optimalPath = [], numberPath = [])
    list += node.data
    paths.push(list)
    currentCost.push(currentCostLast)

    addDataOfOptimaCost(node, list, nodeFData, currentCostLast, optimalCost, optimalPath, numberPath)
    printData(node,nodeFData,list,currentCostLast)

    if node.leftChild.nil? and node.rightChild.nil?
        return list,paths,currentCost,optimalCost,optimalPath,numberPath
    end

    if !node.leftChild.nil?
        currentCostLast += node.leftWeight
        list,paths,currentCost,optimalCost,optimalPath,numberPath = listBritishMuseumAlgorithmRecursive(node.leftChild, nodeFData, list, paths, currentCostLast, currentCost, optimalCost, optimalPath, numberPath)
    
        list = list.chop
        currentCostLast = currentCostLast-node.leftWeight
        paths.push(list)
        currentCost.push(currentCostLast)
    
        addDataOfOptimaCost(node, list, nodeFData, currentCostLast, optimalCost, optimalPath, numberPath)
        printData(node,nodeFData,list,currentCostLast)
    end



    if !node.rightChild.nil?
        currentCostLast += node.rightWeight
        list,paths,currentCost,optimalCost,optimalPath,numberPath = listBritishMuseumAlgorithmRecursive(node.rightChild, nodeFData, list, paths, currentCostLast, currentCost, optimalCost, optimalPath, numberPath)
    
        list = list.chop
        currentCostLast = currentCostLast-node.rightWeight
        paths.push(list)
        currentCost.push(currentCostLast)
    
        addDataOfOptimaCost(node, list, nodeFData, currentCostLast, optimalCost, optimalPath, numberPath)
        printData(node,nodeFData,list,currentCostLast)
    end



    return list,paths,currentCost,optimalCost,optimalPath,numberPath
end

def getMinCostAndPath(cost1, path1, cost2, path2)
    if cost2 == "none"
        return cost1,path1,true
    end
    puts "#{cost1} < #{cost2} = #{cost1 < cost2}"
    if cost1 < cost2
        return cost1,path1,true
    else
        return cost2,path2,false
    end
end

def addDataOfOptimaCost(node, list, nodeFData, currentCostLast, optimalCost, optimalPath, numberPath)
    if node.data == nodeFData
        puts "Cost #{currentCostLast} - #{optimalCost[-1]}"
        puts "Camino #{list} - #{optimalPath[-1]}"
        puts "Vacio? #{optimalCost.empty?} - #{optimalPath.empty?}"
        if optimalCost.empty? and optimalPath.empty?
            optimalCost.push(currentCostLast)
            optimalPath.push(list)
            numberPath.push(0)
            puts "Agrega #{currentCostLast} y #{list}"
        else
            cost, path, info = getMinCostAndPath(currentCostLast, list, optimalCost[-1], optimalPath[-1])
            puts "min cost: #{cost}, #{path}, #{info}"
            if info
                optimalCost.push(cost)
                optimalPath.push(path)
                numberPath.push(numberPath[-1]+1)
                puts "Agrega #{cost} y #{path}"
            else
                optimalCost.push(optimalCost[-1])
                optimalPath.push(optimalPath[-1])
                numberPath.push(numberPath[-1])
            end
        end
        puts "#{optimalCost}"
    else
        if optimalCost.empty? and optimalPath.empty?
            optimalCost.push("none")
            optimalPath.push("none")
            numberPath.push(0)
        else
            puts "-------#{node.data}----------"
            optimalCost.push(optimalCost[-1])
            optimalPath.push(optimalPath[-1])
            numberPath.push(numberPath[-1])
            puts "#{optimalCost}"
        end
    end
end

def printData(node,nodeFData,list,currentCostLast)
    puts "node: #{node.data}"
    #puts node.data == nodeFData
    puts "list: #{list}"
    puts "currentCostLast: #{currentCostLast}"  
    puts "-----------------------------------------------------"  
end