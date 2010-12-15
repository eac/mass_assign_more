module MassAssignMore
  module Compatibility

    def self.included(base)
      base.class_eval do
        MassAssignMore::Compatibility.mass_assignment_instance_methods.each { |instance_method| undef instance_method }
      end

      base.instance_eval do
        MassAssignMore::Compatibility.mass_assignment_class_methods.each { |class_method| undef class_method }
      end

    end

    def remove_attributes_protected_from_mass_assignment(attributes)
      sanitize_for_mass_assignment(attributes)
    end

    module_function

    def mass_assignment_instance_methods
      [ :remove_attributes_protected_from_mass_assignment ]
    end

    def mass_assignment_class_methods
      [ :accessible_attributes, :protected_attributes, :attr_accessible, :attr_protected ]
    end

  end
end
