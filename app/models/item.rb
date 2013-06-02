class Item < ActiveRecord::Base
  attr_accessible :name, :rating
  belongs_to :poll
  has_many :item_images, :dependent => :destroy

  def self.create_etsy_item(item)

  end
end
