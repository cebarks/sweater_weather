Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecasts#show', as: 'forecast'

      get '/backgrounds', to: 'backgrounds#show', as: 'backgrounds'
      get '/locations', to: 'locations#show', as: 'locations'

      resources :users, only: :create
      resources :favorites, only: [:create, :index, :destroy]
      resources :sessions, only: :create
      resources :gifs, only: :index
    end
  end
end
