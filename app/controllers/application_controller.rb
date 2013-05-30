class ApplicationController < ActionController::Base
  protect_from_forgery

  def home
    @user =
  end
end
