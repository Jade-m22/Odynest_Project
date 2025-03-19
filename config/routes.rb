Rails.application.routes.draw do
  devise_for :users
  devise_for :providers

  # Routes pour les utilisateurs
  resources :users, only: %i[index show edit update destroy]

  # Routes pour les expériences (listées, création, édition, suppression, affichage)
  resources :experiences do
    resources :reservations, only: [:create, :destroy, :index]
    resources :reviews, only: [:create, :destroy, :index]
  end

  # Routes pour les fournisseurs (Providers)
  resources :providers, only: [:index, :show]

  # Page d'accueil
  root "experiences#index"
end
