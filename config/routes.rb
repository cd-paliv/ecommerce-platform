Rails.application.routes.draw do
  get "home/index"
  get "sessions/new"
  post "sessions/create"
  get "sessions/destroy"

  resources :users do
    member do
      patch :deactivate
    end
  end

  resources :products do
    member do
    end
  end

  resources :sales, except: [ :new, :destroy, :create ] do
    member do
      patch :cancel
      post :checkout
    end
    resources :sale_items, only: [ :create, :destroy ]
  end

  resources :colors
  resources :sizes
  resources :categories

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"
end
