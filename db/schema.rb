# db:schema:load

ActiveRecord::Schema.define(:version => 20130604193317) do

  create_table "item_image_urls", :force => true do |t|
    t.integer  "item_id"
    t.string   "url"
    t.boolean  "primary_image", :default => false
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "items", :force => true do |t|
    t.text     "name"
    t.float    "rating",      :default => 0.0
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "poll_id"
    t.integer  "listing_id"
    t.text     "description"
    t.integer  "times_rated"
  end

  create_table "polls", :force => true do |t|
    t.string   "name"
    t.string   "etsy_username"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
