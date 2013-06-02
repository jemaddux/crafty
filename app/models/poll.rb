class Poll < ActiveRecord::Base
  attr_accessible :etsy_username, :name
  has_many :items, :dependent => :destroy
end
