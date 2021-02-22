class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :nickname, :email, :first_name, :last_name, :first_name_read, :last_name_read, :birth_day, ])
  end


  def new
  end

  # def create
  #   User.create(user_params)
  # end
end