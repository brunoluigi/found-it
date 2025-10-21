class OmniauthCallbacksController < ApplicationController
  allow_unauthenticated_access only: [ :google_oauth2 ]

  def google_oauth2
    auth = request.env["omniauth.auth"]
    user = User.find_or_create_from_omniauth(auth)
    if user.persisted?
      start_new_session_for(user)
      redirect_to after_authentication_url, notice: "Signed in with Google!"
    else
      redirect_to new_session_path, alert: "Could not authenticate via Google."
    end
  end

  def failure
    redirect_to new_session_path, alert: "Google authentication failed."
  end
end
