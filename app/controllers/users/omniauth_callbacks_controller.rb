class Users::OmniauthCallbacksController < ApplicationController
  def method_missing(provider)
    omniauth = env["omniauth.auth"]
    @user = User.find_for_user_oauth( omniauth, nil )

    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => omniauth['provider']
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.twitter_data"] = env["omniauth.auth"]
      redirect_to root_path
    end
  end
end
