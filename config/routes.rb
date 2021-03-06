Crafty::Application.routes.draw do
  resources :polls
  match "polls/:id/select_items", to: "polls#select_items"
  match "polls/:id/select", to: "polls#select", as: "select"
  match "results/:id", to: "polls#results", as: "results"
  match "item_rating", to: "items#item_rating"
  match "rate_item", to: "items#rate_item"
  match "etsy_login", to: "application#etsy_login"
  match "etsy_callback", to: "application#etsy_callback"
  root :to => "polls#home"
end


