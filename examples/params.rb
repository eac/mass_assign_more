# Demonstrates support for arbitrary objects...
#
class Params < Hash
  extend ActiveRecord::MassAssignmentSecurity
  include MassAssignMore::Context
  
  cattr_accessor :logger
  
  attr_accessible :name
  accessible_attributes[:admin] = [ :plan_id ]
  
  attr_accessor :mass_assignment_context
  
  def sanitize!
    replace(sanitized)
  end
  
  def sanitized
    remove_attributes_protected_from_mass_assignment(self)
  end

end
