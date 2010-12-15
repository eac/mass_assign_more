module MassAssignMore # :nodoc:
  autoload :Context, 'mass_assign_more/context'

  begin
    require 'active_model/mass_assignment_security'
  rescue LoadError
    warn "Failed to load active model's mass assignment security module, falling back to compatibility version"
    require 'mass_assign_more/compatibility'
  end

end
