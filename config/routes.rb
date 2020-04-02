Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  resources :products do
    collection do
      get "buy"
    end
  end
  resources :users do
    collection do
      get "rogout"
    end
  end    

  

end