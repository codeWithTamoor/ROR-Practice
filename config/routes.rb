Rails.application.routes.draw do
  get "carts/show"
  get "vehicles/index"
  get "vehicles/show"
  get "vehicles/edit"
  get "vehicles/update"
  get "vehicles/new"
  resources :publishers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  # get "/books", to: "books#index"
  # resources :books

  resources :products

  # scope module
  scope module: :admin do
  resources :books
  # collection
  resources :books do
  collection do
    get :search
  end
  end

  # concerns
  concern :reviewable do
    resources :reviews
  end

  # shallow
  resources :books do
  resources :reviews, shallow: true
  end
  resources :customers do
    member do
      get "preview"
    end
  end

  resources :authors do
    resources :books, only: [ :index ]
  end
  resources :customers do
    resources :orders
  end
  end
  # scope
  scope "/dashboard" do
  resources :books, concerns: :reviewable
  end

  # memebers
  resources :books do
  member do
    get :preview
    post :mark_as_read
  end
  end


  # namespace
  namespace :admin do
    get "orders/index"
    get "orders/show"
    get "customers/index"
    get "customers/show"
    get "books/index"
    get "books/show"
    resources :books, concerns: :reviewable
    resources :authors
    resources :customers
    resources :orders
    # concerns: :reviewable
  end
end
