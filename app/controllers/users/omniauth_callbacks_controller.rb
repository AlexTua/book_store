class Users::OmniauthCallbacksController < ApplicationController
  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      save_user_to_order
      flash[:notice] = "Facebook signed in successfully."
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  private

  def failure
    flash[:alert] = "Facebook log in failed"
    redirect_to new_user_session_path
  end
end
