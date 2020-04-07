Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
    delete 'destroy_user_session', to: 'users/sessions#destroy'

  end
 
  root to: "products#index"
  resources :products do
    collection do
      get "buy"
    end
  end
  resources :images

  resources :users do
    collection do
      get "rogout"
    end
  end    

  

end