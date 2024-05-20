class RegistrationsController < Devise::RegistrationsController
  protected
  

  def after_sign_up_path_for(resource)
    user_path(@user.id)
    flash[:notice] = "Welcome! You have signed up successfully."
    super
  end
end

