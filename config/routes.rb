Seatyourself2::Application.routes.draw do
  # get "reservations/show"
  # get "reservations/new"
  # get "reservations/create"
  # get "reservations/edit"
  # get "reservations/destroy"
  # # get "sessions/new"
  # get "sessions/create"
  # get "sessions/destroy"
  # get "users/new"
  # get "users/create"
  resources :restaurants do
  	resources :reservations, :except => [:index]

  end


  resources :users, :only => [:new, :create]
  resources :sessions, :only => [:new, :create, :destroy]
end
