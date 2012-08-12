class RegistrationsController < Devise::RegistrationsController

    protected
      #devise after-registration redirect
      def after_sign_up_path_for(resource)
        bookmarklet_url(user: current_user.name)
      end
end

