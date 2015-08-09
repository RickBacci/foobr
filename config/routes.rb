Rails.application.routes.draw do

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resources :home, only: [:show]
  resources :users, only: [:show, :edit, :update]
  resources :specialties, only: [:new, :create, :index]
  resources :projects, only: [:index, :new, :create]

  root to: "home#show"
end
