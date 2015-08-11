Rails.application.routes.draw do

  get '/auth/google_oauth2', as: '/login'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  get '/get_specialties', to: 'specialties#get_specialties'

  resources :sessions, only: [:create, :destroy]
  resources :home, only: [:show]
  resources :users, only: [:show, :edit, :update]
  resources :specialties, only: [:new, :create, :index]
  resources :projects, only: [:index, :new, :create]

  get '/calendars/primary', to: 'calendars#primary'

  root to: "home#show"
end
