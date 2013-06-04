class AddMoreUrlsToIiUs < ActiveRecord::Migration
  def change
    add_column :item_image_urls, :small_url, :text, :limit => nil
    add_column :item_image_urls, :medium_url, :text, :limit => nil
    add_column :item_image_urls, :full_url, :text, :limit => nil
  end
end
