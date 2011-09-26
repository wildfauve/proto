Proto::Application.routes.draw do

  get "log_in" => "sessions#new", :as => "log_in"

  get "users/new"
  
  resources :sessions

  resources :members do
    resources :registers
    collection do
      delete 'delete_all'
    end
  end
  
end
