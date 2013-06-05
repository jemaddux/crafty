class ItemsController < ApplicationController
  def rate_item
    Item.rate(params[:item_id], params[:rating])
    redirect_to :back
  end

  def item_rating
    @rating = Item.find(params[:id]).rating.to_s[0..2].to_f
    render :json => @rating
  end
end
