module OpenProject::AutoProject
  module Patches
    module UserPatch

      def self.included(base)
        base.class_eval do
          unloadable

          include InstanceMethods

          before_save :remember_if_activated
          after_save :build_user_project
        end
      end


      module InstanceMethods

        def remember_if_activated
          @was_activated = false
          # Return unless user was registered, is now active
          # Or the user is created and activated immediately
          return unless ((self.status_change == [User::STATUSES[:registered], User::STATUSES[:active]] ) ||
            (self.new_record? && self.status == User::STATUSES[:active]))

          # Or the project exists already
          return if Project.find_by_identifier user_project_identifier
          @was_activated = true
        end
        
        def build_user_project
          return unless @was_activated

          user_project = Project.create :identifier => user_project_identifier, :name => name, :is_public => false
          memberships.create :project => user_project, :roles => [user_project_role]
        end

        private

        def user_project_identifier
          login.gsub /[@.]/, '_'
        end

        def user_project_role
          # Assign project role id by precedence:
          # 1. Setting override within AP plugin
          # 2. Default Project assigned role
          # 3. First assignable role
          id = Setting.plugin_openproject_auto_project[:user_project_role_id] ||
            Setting.new_project_user_role_id.to_i

          Role.givable.find_by_id(id) || Role.givable.first
        end
      end
    end
  end
end

User.send(:include, OpenProject::AutoProject::Patches::UserPatch)
