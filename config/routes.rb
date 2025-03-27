Rails.application.routes.draw do
  devise_for :users
  devise_for :providers

  # Routes pour les utilisateurs
  get "users/dashboard", to: "users#dashboard", as: "user_dashboard"
  get "user/settings", to: "users#settings", as: :user_settings
  get "provider/settings", to: "providers#settings", as: :provider_settings
  get "/pages/toggle_font", to: "pages#toggle_font", as: :toggle_font
  get "/set_daltonism", to: "pages#set_daltonism", as: :set_daltonism

  resources :users, only: %i[index show edit update destroy]
  resources :providers, only: %i[index edit update destroy]

  # Routes dashboards
  get "providers/dashboard", to: "providers#dashboard", as: "provider_dashboard"

  # Routes pour les expériences (listées, création, édition, suppression, affichage)
  resources :experiences do
    collection do
      get :quiz  # ✅ Route pour la page de quiz
    end

    resources :reservations, only: [ :create, :destroy, :index, :edit, :update ]
    resources :reviews, only: [ :create, :destroy, :index ]
    post "create_stripe_checkout_session", on: :member
    get "payment_success", on: :member
    get "payment_cancel", on: :member
  end

  # Routes pour les static_pages
  get "/about", to: "pages#about"
  get "/contact", to: "pages#contact"
  get "/legal_mentions", to: "pages#legal_mentions"
  get "/terms", to: "pages#terms"

  # Page d'accueil
  root "pages#home"
end
