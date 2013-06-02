class AddStuffToItems < ActiveRecord::Migration
  def change
    add_column :items, :listing_id, :integer
    add_column :items, :description, :string
  end
end
