class ItemsController < ApplicationController
  def rate_item
    Item.rate(params[:item_id], params[:rating])
    redirect_to :back
  end

  def item_rating
    @rating = Item.find(params[:id]).rating
    render :json => @rating
  end
end
