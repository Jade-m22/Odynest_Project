Rails.application.routes.draw do
  devise_for :users
  devise_for :providers

  # Routes pour les utilisateurs
  get "users/dashboard", to: "users#dashboard", as: "user_dashboard"
  resources :users, only: %i[index show edit update destroy]
  resources :providers, only: %i[index edit update destroy]

  # Routes dashboards
  get "providers/dashboard", to: "providers#dashboard", as: "provider_dashboard"

  # Routes pour les expériences (listées, création, édition, suppression, affichage)
  resources :experiences do
    resources :reservations, only: [ :create, :destroy, :index ]
    resources :reviews, only: [ :create, :destroy, :index ]
  end

  # Routes pour les static_pages
  get "/about", to: "pages#about"
  get "/contact", to: "pages#contact"
  get "/legal_mentions", to: "pages#legal_mentions"
  get "/terms", to: "pages#terms"

  # Page d'accueil
  root "pages#home"
end
