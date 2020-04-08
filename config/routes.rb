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

  resources :products, only: [:index, :new, :create, :show, :edit, :update] do
    
    collection do
      post 'purchase'
      get "category"
      get "search"
    end
  end

  resources :cards, only: [:index, :new, :create, :destroy]


  resources :users, only: [:show] do

    collection do
      get "rogout"
    end
  end    

  

end