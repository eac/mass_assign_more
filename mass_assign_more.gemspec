# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "mass_assign_more"
  s.version     = "0.5.0"
  s.authors     = ["Eric Chapweske"]
  s.email       = ["eac@zendesk.com"]
  s.homepage    = "https://github.com/eac/mass_assign_more"
  s.summary     = "Context based authorizers for ActiveModel's mass assignment security feature"
  s.description = "Mass assign more things"

  s.rubyforge_project = "mass_assign_more"


  s.add_development_dependency("rake")
  s.add_development_dependency("shoulda")
  s.add_development_dependency("mocha")

  s.files         = Dir["lib/**/*"]
  s.test_files    = Dir["test/**/*"]
  s.require_paths = ["lib"]
end
