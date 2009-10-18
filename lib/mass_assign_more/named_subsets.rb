module MassAssignMore
  # Adds support for named subsets, as well as merging those subsets with itself:
  #
  # Example:
  # permissions = PermissionSet[ 'name' ]
  # permissions[:admin] = [ 'plan_id' ]
  # permissions.with(:admin)
  # => PermissionSet[ 'name', 'plan_id' ]
  #
  module NamedSubsets # :nodoc:
  
    def [](key)
      named_subsets[key]
    end
  
    # Assigns a subset, storing the values using an instance of the current container's class.
    #
    # Example:
    # permissions = PermissionSet[ 'name' ]
    # permissions[:admin] = [ 'plan_id' ]
    # permissions[:admin]
    # => PermissionSet[ 'plan_id' ]
    #
    def []=(key, values)
      named_subsets[key] += values
    end
    
    def with(*keys)
      dup.with!(*keys)
    end
    
    # Combines sublists with itself.
    #
    # Example:
    # permissions = PermissionSet[ 'name' ]
    # permissions[:admin] = [ 'plan_id' ]
    # permissions.with!(:admin)
    # => PermissionSet[ 'name', 'plan_id' ]
    #
    def with!(*keys)
      named_subsets.values_at(*keys).each { |named_subset| merge(named_subset) }
      self
    end
  
    protected
    
    attr_writer :named_subsets
  
    def named_subsets
      @named_subsets ||= Hash.new { |hash,key| hash[key] = self.class.new }
    end
  
  end
end
