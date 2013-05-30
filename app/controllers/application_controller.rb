class ApplicationController < ActionController::Base
  protect_from_forgery

  def home

  end

  def etsy_callback
    access_token = Etsy.access_token(
    session[:request_token],
    session[:request_secret],
    params[:oauth_verifier]
    )
    # access_token.token and access_token.secret can now be saved for future API calls
    redirect root_path
  end

  def login_to_etsy
    request_token = Etsy.request_token
    session[:request_token]  = request_token.token
    session[:request_secret] = request_token.secret
    redirect Etsy.verification_url
  end
end
