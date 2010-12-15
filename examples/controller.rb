# Allow visitors with the 'admin' role to mass assign the :plan_id attribute.
#
class AccountsController < ApplicationController
  include ActiveModel::MassAssignmentSecurity
  # Step 1
  include MassAssignMore::Context

  # Step 2
  attr_accessible :name
  accessible_attributes['admin'] = [ :plan_id ]

  def update
    account = Account.find(params[:id])
    account.update_attributes(account_params)
    # ...
  end

  protected

  # Step 3
  # If current_user_role returns 'admin', the accessible_attributes
  # list expands to [ :name, :plan_id ] instead of just [ :name ].
  def mass_assignment_context
    current_user.role
  end

  def account_params
    @account_params ||= remove_attributes_protected_from_mass_assignment(params[:account])
  end

end
