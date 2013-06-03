class AddTimesRatedToItems < ActiveRecord::Migration
  def change
    add_column :items, :times_rated, :integer
  end
end
