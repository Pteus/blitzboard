Rails.application.routes.draw do
  namespace :admin do
    resources :players
    resources :teams
    resources :matches, only: [ :new, :create ]
  end

  get "up" => "rails/health#show", as: :rails_health_check

  resources :teams, only: [ :show ]
  resources :players, only: [ :show ]
  resources :matches, only: [ :index ]
end
