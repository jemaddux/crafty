class ApplicationController < ActionController::Base
  protect_from_forgery

  def home
    @user = Etsy.user("johnmaddux")

    # @me = Etsy.myself(session[:access.token, access.secret)
  end

  def etsy_callback
    access_token = Etsy.access_token(
    session[:request_token],
    session[:request_secret],
    params[:oauth_verifier]
    )
    session[:access_token] = access_token
    # access_token.token and access_token.secret can now be saved for future API calls
    redirect_to root_path
  end

  def etsy_login
    request_token = Etsy.request_token
    session[:request_token]  = request_token.token
    session[:request_secret] = request_token.secret
    redirect_to root_path #etsy_callback_path #Etsy.verification_url
  end
end
