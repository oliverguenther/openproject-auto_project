# encoding: UTF-8
$:.push File.expand_path("../lib", __FILE__)

require 'open_project/auto_project/version'
# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "openproject-auto_project"
  s.version     = OpenProject::AutoProject::VERSION
  s.authors     = ["Oliver Günther", "Felix Schäfer"]
  s.email       = "mail@oliverguenther.de"
  s.homepage    = "https://www.github.com/oliverguenther/openproject-auto_project"
  s.summary     = 'Auto Project'
  s.description = "This plugin creates a new top-level private project for new users."
  s.license     = "MIT"

  s.files = Dir["{app,config,lib}/**/*"] + %w(README.md)

  s.add_dependency "rails", "~> 3.2"

end
