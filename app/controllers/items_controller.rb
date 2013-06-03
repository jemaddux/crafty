class ItemsController < ApplicationController
  def rate_item
    item = Item.find(params[:item_id])
    item.rating = params[:rating]
    item.save!
    redirect_to :back
  end
end
