class PollsController < ApplicationController
  # def index
  #   @polls = Poll.all
  # end

  def new
    @poll = Poll.new
  end

  # def edit
  #   @poll = Poll.find(params[:id])
  # end

  def create
    @poll = Poll.new(params[:poll])
    @poll.etsy_username = params[:username]
    @poll.save!

    if @poll.save
      redirect_to @poll, notice: 'poll was successfully created.'
    else
      render action: "new"
    end
  end

  def show
    @poll = Poll.find(params[:id])
    initialize_etsy
    @user = Etsy::User.find(@poll.etsy_username)
    @faves = Etsy::FavoriteListing.find_all_user_favorite_listings(@user.id)
    @items = []
    @faves.each do |fav|
      item = Etsy::Listing.find(fav.result["listing_id"])
      Item.create_etsy_item(item, @poll.id)
      @items << item
    end

    # @image = Etsy::Image.find_all_by_listing_id(Item.first.listing_id)
  end

  # def update
  #   @poll = Poll.find(params[:id])

  #   if @poll.update_attributes(params[:poll])
  #     redirect_to @poll, notice: 'poll was successfully updated.'
  #   else
  #     render action: "edit"
  #   end
  # end

  # def destroy
  #   @poll = Poll.find(params[:id])
  #   @poll.destroy
  #   redirect_to polls_url
  # end

private
  def initialize_etsy
    Etsy.api_key = 'zq28pq66whj2cp3tfy9lqz6x'
    Etsy.api_secret = 'owztxt2cyb'
    Etsy.environment = :production
  end
end
