class ItemImageUrl < ActiveRecord::Base
  attr_accessible :item_id, :primary_image, :url
  belongs_to :item
end
