class Poll < ActiveRecord::Base
  attr_accessible :etsy_username, :name
  has_many :items, :dependent => :destroy

  def etsy
    @user = Etsy::User.find(etsy_username)
    @faves = Etsy::FavoriteListing.find_all_user_favorite_listings(@user.id)
    @items = []
    @faves.each do |fav|
      item = Etsy::Listing.find(fav.result["listing_id"])
      Item.create_etsy_item(item, id)
      @items << item
    end
  end
end
