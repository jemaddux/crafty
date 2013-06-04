class ItemsController < ApplicationController
  def rate_item
    item = Item.find(params[:item_id])
    if params[:rating].to_f <= 5 && params[:rating].to_f >= 0
      rating = params[:rating].to_f
    else
      rating = item.rating
    end
    total_rating = item.rating * item.times_rated
    total_rating += rating
    item.times_rated += 1
    item.rating = total_rating / item.times_rated
    item.save!
    redirect_to :back
  end

  def item_rating
    item = Item.find(params[:id])
    @rating = item.rating
    render :json => @rating
  end
end
