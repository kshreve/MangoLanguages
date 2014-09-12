class Node
    def initialize(name, dependencies)
        @name = name
        @dependencies = []
        for dep in dependencies
            add_dependency(dep)
        end
    end
    
    def add_dependency(dep)
        if(!@dependencies.include?(dep))
	    	@dependencies.push(dep)
        end
    end
    
    def get_dependencies
       return @dependencies.to_set
    end
end
