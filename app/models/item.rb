class Item < ActiveRecord::Base
  attr_accessible :name, :rating
  belongs_to :poll
  has_many :item_image_urls, :dependent => :destroy

  def self.create_etsy_item(etsy_item, poll_id)
    item = Item.new
    item.poll_id = poll_id
    item.name = etsy_item.result["title"]
    item.rating = 0
    item.times_rated = 0
    item.listing_id = etsy_item.result["listing_id"]
    item.description = etsy_item.result["description"]
    item.save!

    ItemImageUrl.create_from_etsy(item.listing_id, item.id)
  end

  def self.rate(item_id, incoming_rating)
    item = Item.find(item_id)
    if incoming_rating.to_f <= 5 && incoming_rating.to_f >= 0.00001
      new_rating = incoming_rating.to_f
      total_rating = item.rating * item.times_rated
      total_rating += new_rating
      item.times_rated += 1
      item.rating = total_rating / item.times_rated
      item.save!
    else
    end
  end
end
