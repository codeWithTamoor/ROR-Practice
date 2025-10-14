Rails.application.routes.draw do
  get "pages/practice"
  get "carts/show"
  get "vehicles/index"
  get "vehicles/show"
  get "vehicles/edit"
  get "vehicles/update"
  get "vehicles/new"

  resources :publishers
  resources :books
  resources :products
  resources :enrollments, only: [:index, :show, :create, :destroy]

  # Devise
  devise_for :users

  # Practice routes
  get "practice", to: "demos#practice_form"
  post "/practice_submit", to: "demos#practice_submit"

  # CUSTOMERS
  resources :customers do
    member do
      get "preview"
    end
    resources :orders  # nested under customers
  end

  # AUTHORS
  resources :authors

  # ==== ADMIN SCOPE ====
  scope module: :admin do
    # Books (scoped to admin)
    resources :books do
      collection do
        get :search
      end
    end

    # Concerns
    concern :reviewable do
      resources :reviews
    end

    # Shallow routes
    resources :reviews, shallow: true
  end

  # ==== ADMIN NAMESPACE ====
  namespace :admin do
    get "orders/index"
    get "orders/show"
    get "customers/index"
    get "customers/show"
    get "books/index"

    resources :authors
    resources :customers
    resources :orders
  end

  # Root route
  root "books#index"
end
