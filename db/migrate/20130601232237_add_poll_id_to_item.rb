class AddPollIdToItem < ActiveRecord::Migration
  def change
    add_column :items, :poll_id, :integer
  end
end
