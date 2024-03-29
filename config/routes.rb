Proto::Application.routes.draw do
  
  get "log_in" => "sessions#new", :as => "log_in"
  get "log_out" => "sessions#destroy", :as => "log_out" 
  get "users/new"
  
  root :to => "sessions#new"
  
  namespace :admin do
    resources :members
    resources :products
    resources :logs, :only => [:index]
  end 
  
  resources :sessions

  resources :members, :only => [:show] do
    resources :registers
    resources :offers
  end
    
end
