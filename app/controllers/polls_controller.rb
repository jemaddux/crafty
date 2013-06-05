class PollsController < ApplicationController
  def home
  end

  def new
    @poll = Poll.new
  end

  def create
    @poll = Poll.new(params[:poll])
    @poll.etsy_username = params[:username]
    @poll.save!
    initialize_etsy
    @poll.etsy

    if @poll.save
      redirect_to @poll, notice: 'poll was successfully created.'
    else
      render action: "new"
    end
  end

  def select
    @poll = Poll.find(params[:id])
  end

  def edit
    @poll = Poll.find(params[:id])
    @poll.name = params[:poll_name]
    item_ids = params.select{|k,v| v == '1' }.map{|i| i[0] }
    @poll.items.each do |item|
      item.delete if item_ids.include? item.id.to_s
    end

    if @poll.save
      redirect_to @poll, notice: 'poll was successfully created.'
    else
      render action: "new"
    end
  end

  def show
    @poll = Poll.find(params[:id])
  end

  def results
    poll = Poll.find(params[:id])
    @results = poll.items.sort_by{|p| p.rating}.reverse
  end

private
  def initialize_etsy
    Etsy.api_key = 'zq28pq66whj2cp3tfy9lqz6x'
    Etsy.api_secret = 'owztxt2cyb'
    Etsy.environment = :production
  end
end
