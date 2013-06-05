require 'spec_helper'

describe Poll do

  def initialize_etsy
    Etsy.api_key = 'zq28pq66whj2cp3tfy9lqz6x'
    Etsy.api_secret = 'owztxt2cyb'
    Etsy.environment = :production
  end

  describe ".new" do
    it "creates a new poll" do
      poll_count = Poll.count
      poll = Poll.new
      poll.etsy_username = "johnmaddux"
      poll.save!
      expect(Poll.count).to eq (poll_count + 1)
    end
  end

  describe ".etsy" do
    it "finds an etsy user and creates a poll" do
      VCR.use_cassette("dot_etsy") do
        poll_count = Poll.count
        poll = Poll.new
        poll.etsy_username = "johnmaddux"
        poll.save!
        expect(Poll.count).to eq (poll_count + 1)
        item_count = Item.count
        initialize_etsy
        poll.etsy
        expect(Item.count).to eq (item_count + 18)
      end
    end
  end
end
