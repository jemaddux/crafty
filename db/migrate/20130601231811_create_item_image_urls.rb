class CreateItemImageUrls < ActiveRecord::Migration
  def change
    create_table :item_image_urls do |t|
      t.integer :item_id
      t.string :url
      t.boolean :primary_image, :default => false

      t.timestamps
    end
  end
end
