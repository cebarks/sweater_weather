Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecasts#show', as: 'forecast'
      get '/backgrounds', to: 'backgrounds#show', as: 'backgrounds'
      get '/locations', to: 'locations#show', as: 'locations'

      delete '/favorites', to: 'favorites#destroy'

      resources :users, only: :create
      resources :favorites, only: [:create, :index]
      resources :sessions, only: :create
      resources :gifs, only: :index
    end
  end
end
