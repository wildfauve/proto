Proto::Application.routes.draw do

  get "log_in" => "sessions#new", :as => "log_in"
  get "log_out" => "sessions#destroy", :as => "log_out" 
  get "users/new"
  
  root :to => "sessions#new"
  
  resources :sessions

  resources :members do
    resources :registers
    resources :offers
  end
  
  resources :products
  
  
end
