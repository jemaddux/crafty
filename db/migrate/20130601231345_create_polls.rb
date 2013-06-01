class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.string :name
      t.string :etsy_username

      t.timestamps
    end
  end
end
