class ApplicationController < ActionController::Base
  protect_from_forgery

  def home
    initialize_etsy
    @user = Etsy::User.find('johnmaddux')
    @favs = Etsy::FavoriteListing.find_all_user_favorite_listings(@user.id)
  end

private
  def initialize_etsy
    Etsy.api_key = 'zq28pq66whj2cp3tfy9lqz6x'
    Etsy.api_secret = 'owztxt2cyb'
    Etsy.environment = :production
  end

  # def etsy_callback
  #   access_token = Etsy.access_token(
  #   session[:request_token],
  #   session[:request_secret],
  #   params[:oauth_verifier]
  #   )
  #   session[:access_token] = access_token
  #   # access_token.token and access_token.secret can now be saved for future API calls
  #   redirect_to root_path
  # end

  # def etsy_login
  #   request_token = Etsy.request_token
  #   session[:request_token]  = request_token.token
  #   session[:request_secret] = request_token.secret
  #   redirect_to root_path #etsy_callback_path #Etsy.verification_url
  # end
end
