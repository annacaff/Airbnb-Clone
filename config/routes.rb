Rails.application.routes.draw do
  devise_for :users
  root "listings#index"

  resources :listings do
    resources :bookings, only: [:new, :create, :show, :destroy] do
      resources :reviews, only: [:create, :show]
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end

