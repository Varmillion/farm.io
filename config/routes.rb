Rails.application.routes.draw do

  resources :comments
  devise_for :users
  resources :ads do
  	resources :comments
  	member do
  		put "like", to: "ads#upvote"
  	end
  end  
  resources :users
  root "ads#index"

end