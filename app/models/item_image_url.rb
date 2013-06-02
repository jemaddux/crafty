class ItemImageUrl < ActiveRecord::Base
  attr_accessible :item_id, :primary_image, :url
  belongs_to :item

  def self.create_from_etsy(item_listing_id, item_id)
    images = Etsy::Image.find_all_by_listing_id(item_listing_id)
    first = true
    images.each do |image|
      iiu = ItemImageUrl.new
      iiu.url = image.result["url_570xN"]
      iiu.primary_image = first
      iit.item_id = item_id
      iiu.save!
      first = false
    end
  end
end
