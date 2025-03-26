class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # Permet l'ajout des paramètres nécessaires pour User et Provider
  def configure_permitted_parameters
    # Pour l'inscription et la mise à jour de l'utilisateur
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :username ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :username ])

    # Pour l'inscription et la mise à jour du provider
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :first_name ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :first_name ])
  end
end
