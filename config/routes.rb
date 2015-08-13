Rails.application.routes.draw do


  get '/auth/google_oauth2', as: '/login'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  get '/get_specialties', to: 'specialties#get_specialties'

  resources :sessions, only: [:create, :destroy]
  resources :home, only: [:show]
  resources :users, only: [:show, :edit, :update]
  resources :specialties, only: [:destroy, :new, :create, :index]
  resources :projects, only: [:index, :new, :create]
  resources :user_specialties, only: [:index, :destroy]

  get  '/calendars/primary', to: 'calendars#primary'
  get  '/calendar/v3/users/me/calendarList', to: 'calendars#calendar_list', as: '/calendar_list'
  post '/calendar/v3/calendars/foobr/events', to: 'calendars#create_event', as: '/create_event'

  root to: "home#show"
  end

