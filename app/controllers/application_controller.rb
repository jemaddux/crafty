class ApplicationController < ActionController::Base
  protect_from_forgery

  def home
    # initialize_etsy
    # @user = Etsy::User.find('johnmaddux')
    # @favs = Etsy::FavoriteListing.find_all_user_favorite_listings(@user.id)
    # @images = []
    # @favs.each do |fav|
    #   @images << Etsy::Image.find_all_by_listing_id(fav.listing_id)
    # end
    # @images = @images.flatten
  end

  def create_poll
    @params = params
    render :poll
  end

private
  def initialize_etsy
    Etsy.api_key = 'zq28pq66whj2cp3tfy9lqz6x'
    Etsy.api_secret = 'owztxt2cyb'
    Etsy.environment = :production
  end
end
