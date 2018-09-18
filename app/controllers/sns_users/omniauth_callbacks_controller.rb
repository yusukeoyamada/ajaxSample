class SnsUsers::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    @sns_user = SnsUser.find_for_facebook_oauth(request.env["omniauth.auth"], current_sns_user)

    if @sns_user.persisted?
      set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
      sign_in_and_redirect @sns_user, event: :authentication
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_sns_user_registration_url
    end
  end

  def google
    @sns_user = SnsUser.find_for_google(request.env['omniauth.auth'])

    if @sns_user.persisted?
      set_flash_message(:notice, :success, kind: "Google") if is_navigational_format?
      sign_in_and_redirect @sns_user, event: :authentication
    else
      session['devise.google_data'] = request.env['omniauth.auth']
      redirect_to new_sns_user_registration_url
    end
  end

  def github
    @sns_user = SnsUser.find_for_github_oauth(request.env["omniauth.auth"], current_sns_user)

    if @sns_user.persisted?
      sign_in_and_redirect @sns_user, :event => :authentication
      set_flash_message(:notice, :success, :kind => "Github") if is_navigational_format?
    else
      session["devise.github_data"] = request.env["omniauth.auth"]
      redirect_to new_sns_user_registration_url
    end
  end
end
