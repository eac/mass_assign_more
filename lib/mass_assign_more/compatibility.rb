module MassAssignMore
  module Compatibility

    def self.included(base)
      if defined?(ActiveRecord::Base) && (base == ActiveRecord::Base)
        remove_mass_assignment_methods(base)
      end
    end

    def remove_attributes_protected_from_mass_assignment(attributes)
      sanitize_for_mass_assignment(attributes)
    end

    module_function

    def remove_mass_assignment_methods(klass)
      klass.class_eval do
        remove_method :remove_attributes_protected_from_mass_assignment
      end

      klass.singleton_class.instance_eval do
        remove_method :accessible_attributes, :protected_attributes, :attr_accessible, :attr_protected
      end
    end

  end
end
