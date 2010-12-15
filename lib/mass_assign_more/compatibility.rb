module MassAssignMore
  module Compatibility

    def self.included(base)
      base.instance_eval do
        remove_method(*MassAssignMore::Compatibility.mass_assignment_instance_methods)
      end

      class << base
        remove_method(*MassAssignMore::Compatibility.mass_assignment_class_methods)
      end

    end

    def remove_attributes_protected_from_mass_assignment(attributes)
      sanitize_for_mass_assignment(attributes)
    end

    module_function

    def mass_assignment_instance_methods
      [ :remove_attributes_protected_from_mass_assignment, :attributes_protected_by_default ]
    end

    def mass_assignment_class_methods
      [ :accessible_attributes, :protected_attributes, :attr_accessible, :attr_protected ]
    end

  end
end
