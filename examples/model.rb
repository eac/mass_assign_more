class Account < ActiveRecord::Base
  include MassAssignMore::Context
  
  belongs_to :user
  
  attr_accessible :name
  accessible_attributes[:admin] = [ :plan_id ]
  
  protected
  
  # Assumes User#role returns :admin when appropriate.
  def mass_assignment_context
    user.role if user
  end
  
end