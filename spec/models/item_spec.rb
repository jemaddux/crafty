require "spec_helper"

describe Item do
  describe "Item.rate(item_id, incoming_rating)" do
    it "changes an items rating" do
      item = Item.new
      item.times_rated = 0
      item.save!
      Item.rate(item.id, 5)
      item = Item.find(item.id)
      expect(item.times_rated).to eq 1
      expect(item.rating).to eq 5
    end

    it "increments an items rating" do
      item = Item.new
      item.times_rated = 1
      item.rating = 3
      item.save!
      Item.rate(item.id, "5")
      item = Item.find(item.id)
      expect(item.times_rated).to eq 2
      expect(item.rating).to eq 4
    end

    it "changes items that already have multiple ratings" do
      item = Item.new
      item.times_rated = 49
      item.rating = 4
      item.save!
      Item.rate(item.id, 1)
      item = Item.find(item.id)
      expect(item.times_rated).to eq 50
      expect(item.rating).to eq 3.94
    end

    it "ignores improper ratings" do
      item = Item.new
      item.times_rated = 1
      item.rating = 3
      item.save!
      Item.rate(item.id, "45")
      item = Item.find(item.id)
      expect(item.times_rated).to eq 1
      expect(item.rating).to eq 3
    end
  end
end
