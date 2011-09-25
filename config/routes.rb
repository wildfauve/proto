Proto::Application.routes.draw do

  resources :members do
    resources :registers
    collection do
      delete 'delete_all'
    end
  end
  
end
