Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/forecast', to: "forecasts#show", as: "forecast"
      # resources :forecast, only: :show
      resources :users, only: :create

      resources :favorites, only: [:create, :index, :destroy]

      resources :sessions, only: :create
    end
  end
end
