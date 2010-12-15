module MassAssignMore # :nodoc:
  autoload :Context, 'mass_assign_more/context'

  begin
    require 'active_model/mass_assignment_security'
  rescue LoadError
    $LOAD_PATH << File.join(File.dirname(__FILE__), 'mass_assign_more', 'compatibility')
  end

end
