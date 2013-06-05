require 'spec_helper'

describe PollsController do
  describe "new" do
    it "creates a new poll" do
      pending
      post :new
      expect(response).to redirect_to root_path
    end
  end

  describe "create" do
    it "fills out the poll and adds items and item_image_urls"

    it "redirets because of bad parameters"
  end

  describe "show" do
    it "returns the poll info"
  end

  describe "results" do
    it "shows a sorted list of the poll items"
  end
end
