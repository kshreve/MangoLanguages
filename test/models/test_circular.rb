require "../test_helper"
require "Dependencies"

class TestBasic < ActiveSupport::TestCase

    test "basic" do
        
        dep = Dependencies.new
        
        dep.add_direct('A', %w{ B } )
        dep.add_direct('B', %w{ C } )
        dep.add_direct('C', %w{ A } )
   
        assert_equal( %w{ A B C }, dep.dependencies_for('A'))
    end
end
