Rails.application.routes.draw do
  # Routes pour les expériences (Expériences listées, création, édition, suppression, affichage)
  resources :experiences

  # Routes pour les fournisseurs (Providers)
  resources :providers, only: [:index, :show]

  # Routes pour les réservations (Reservations)
  resources :experiences do
    resources :reservations, only: [:create, :destroy, :index]
  end

  # Routes pour les avis (Reviews)
  resources :experiences do
    resources :reviews, only: [:create, :destroy, :index]
  end

  # Routes pour les utilisateurs (Users)
  resources :users, only: [:show, :edit, :update]

  # Page d'accueil
  root "experiences#index"
end
