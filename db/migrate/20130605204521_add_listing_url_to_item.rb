class AddListingUrlToItem < ActiveRecord::Migration
  def change
    add_column :items, :listing_url, :text, :limit => nil
  end
end
