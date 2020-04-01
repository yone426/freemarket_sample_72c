Rails.application.routes.draw do
  devise_for :users
  root "products#index"

  resources :users do
    collection do
      get 'rogout'
  end
end

  
end
