Seatyourself2::Application.routes.draw do
  get "users/new"
  get "users/create"
  resources :restaurants
  resources :users, :only => [:new, :create]

end
