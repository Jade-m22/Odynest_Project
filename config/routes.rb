Rails.application.routes.draw do
  devise_for :users
  devise_for :providers

  # Routes pour les utilisateurs
  resources :users, only: %i[index show edit update destroy]

  namespace :provider do
    resources :events, only: [:index, :new, :create, :edit, :update, :destroy]
  end  


  # Routes pour les expériences (listées, création, édition, suppression, affichage)
  resources :experiences do
    resources :reservations, only: [:create, :destroy, :index]
    resources :reviews, only: [:create, :destroy, :index]
  end

  # Routes pour les fournisseurs (Providers)
  resources :providers, only: [:index, :show]

  # Routes pour les static_pages
  get "/about", to: "pages#about"
  get "/contact", to: "pages#contact"
  get "/legal_mentions", to: "pages#legal_mentions"
  get "/terms", to: "pages#terms"

  # Page d'accueil
  root "pages#home"
end
