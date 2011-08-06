require 'redmine'

Redmine::Plugin.register :chiliproject_auto_project do
  name 'Auto Project plugin'
  author 'Felix Schäfer'
  description 'This plugin creates a new top-level private project for new users.'
  version '0.0.1'
  url 'https://github.com/thegcat/chiliproject_auto_project'
end
