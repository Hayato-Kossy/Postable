class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image, :introduction])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :image, :introduction])
    end

    def after_sign_in_path_for(resource)
        posts_path
    end
    
    def after_sign_up_path_for(resource)
        posts_path
    end
end
# in app/controllers/application_controller.rb


