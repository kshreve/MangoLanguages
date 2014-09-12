require 'Node'

class Dependencies 
    def initialize
        @nodeHash = Hash.new{ |hash, key| hash[key] = Node.new(key,[])}
    end
    
    def add_direct(name, deps)
        node = @nodeHash[name]
        if(node)
            for dep in deps
                if(!node.get_dependencies.include?(dep))
                    node.add_dependency(dep)
                end
            end
		else
            node = Node.new(name,deps) 				
        end
		@nodeHash[name] = node
    end
    
    def dependencies_for(name, nameDependencies = SortedSet.new)
		node = @nodeHash[name]
		nodeDependencies = node.get_dependencies	

		if(!nodeDependencies.subset? nameDependencies)			
			nameDependencies.merge(nodeDependencies)	
			for dep in nodeDependencies
				nameDependencies.merge(dependencies_for(dep, nameDependencies))
			end
		end

		return nameDependencies.to_a
    end
end
