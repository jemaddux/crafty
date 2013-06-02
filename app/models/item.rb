class Item < ActiveRecord::Base
  attr_accessible :name, :rating
  belongs_to :poll
  has_many :item_images, :dependent => :destroy

  def self.create_etsy_item(etsy_item, poll_id)
    unless Item.where(listing_id: etsy_item.result["listing_id"],
                      poll_id: poll_id)
      item = Item.new
      item.poll_id = poll_id
      item.name = etsy_item.result["title"]
      item.rating = 0
      item.listing_id = etsy_item.result["listing_id"]
      item.description = etsy_item.result["description"]
      item.save!

      ItemImageUrl.create_from_etsy(item.listing_id, item.id)
    end
  end
end
