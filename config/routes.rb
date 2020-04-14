Rails.application.routes.draw do
  get 'likes/new'
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
      get  'purchase/:id'=>  'products#purchase', as: 'purchase'
      post 'pay/:id'=>   'products#pay', as: 'pay'
      get "category"
      get "search"
      get "previous"
      get "next"
      post 'add' => 'likes#create'
      delete '/add' => 'likes#destroy'
    end
    member do
      get 'categoryindex'
    end
  end

  resources :cards, only: [:index, :new, :create, :destroy]


  resources :users, only: [:show] do

    collection do
      get "rogout"
    end
  end    

  

end