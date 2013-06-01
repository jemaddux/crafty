class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.float :rating, :default => 0

      t.timestamps
    end
  end
end
