# Prevent load-order problems in case openproject-plugins is listed after a plugin in the Gemfile
# or not at all
require 'open_project/plugins'

module OpenProject::AutoProject
  class Engine < ::Rails::Engine
    engine_name :openproject_auto_project

    include OpenProject::Plugins::ActsAsOpEngine


    def self.settings
      { :partial => 'settings/openproject_auto_project',
        :default => {
          # User role to assign to auto-projects.
          :user_project_role_id => nil,
        }
      }
    end

    register 'openproject-auto_project',
      :author_url => 'https://github.com/oliverguenther/openproject_auto_project',
      :requires_openproject => '>= 3.0.0',
      :settings => settings


    patches [ :User ]
  end
end
