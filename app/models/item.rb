class Item < ActiveRecord::Base
  attr_accessible :name, :rating
  belongs_to :poll
  has_many :item_images, :dependent => :destroy
end
