Rails.application.routes.draw do
  root "league#index"

  namespace :admin do
    get "/login", to: "sessions#new", as: :login
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy", as: :logout

    resources :players
    resources :teams
    resources :matches, only: [ :new, :create ]
  end

  get "up" => "rails/health#show", as: :rails_health_check

  resources :teams, only: [ :show ]
  resources :players, only: [ :show ]
  resources :matches, only: [ :index ]
end
