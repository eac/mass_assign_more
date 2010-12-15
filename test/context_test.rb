require 'test_helper'

class ContextTest < Test::Unit::TestCase

  class SimpleRecord
    cattr_accessor :logger
    include ActiveModel::MassAssignmentSecurity
    include MassAssignMore::Context

    attr_accessible :first_name
    accessible_attributes[:admin] = [ :admin ]

    attr_accessor :role
    attr_reader :attributes

    def attributes=(attributes)
      @attributes = remove_attributes_protected_from_mass_assignment(attributes)
    end

    protected

    alias_method :mass_assignment_context, :role

  end

  setup do
    @record = SimpleRecord.new
  end

  should "protect without context" do
    attributes = { 'first_name' => 'allowed', 'admin' => 'admin_context' }
    @record.attributes = attributes

    assert_equal({ 'first_name' => 'allowed' }, @record.attributes)
  end

  should "protect with context" do
    attributes = { 'first_name' => 'allowed', 'admin' => 'admin_context' }
    @record.role = :admin
    @record.attributes = attributes

    assert_equal attributes, @record.attributes
  end

end
