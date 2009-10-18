require 'mass_assign_more/named_subsets'

module MassAssignMore
  # Adds support for more complex permissions that depend on context.
  #
  # Example, given an Account with the attributes :first_name, :plan_id, and :role
  #
  # class Account < ActiveRecord::Base
  #   include MassAssignMore::Context
  # 
  #   attr_accessible :first_name
  #   accessible_attributes['admin'] = [ :plan_id ]
  # 
  #   protected
  # 
  #   alias_method :mass_assignment_context, :role
  # 
  # end
  #
  # account = Account.new
  # account.attributes = { :first_name => 'Eric', :plan_id => 5 }
  # account.attributes # => { :first_name => 'Eric' }
  #
  # account.role = 'admin'
  # account.attributes = { :plan_id => 5 }
  # account.attributes # => { :first_name => 'Eric', :plan_id => 5 }
  #
  module Context
    extend ActiveSupport::Concern

    included do
      accessible_attributes.extend NamedSubsets
    end
    
    protected
    
    def mass_assignment_authorizer # :nodoc:
      super.with(mass_assignment_context)
    end
    
    # Redefine to return the name of a accessible_attribute context.
    # 
    # attr_accessible :first_name
    # accessible_attributes['admin'] = [ :plan_id ]
    #
    # def mass_assignment_context
    #   'admin' if admin?
    # end
    #
    def mass_assignment_context
    end
    
  end
end