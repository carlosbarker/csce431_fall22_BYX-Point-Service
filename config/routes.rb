Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :users, controllers:
  {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # resources define available paths. if listed here, then domain.com/resource_name WILL work, otherwise it will throw a routing error
  resources :members
  resources :users
  resources :events
  resources :alumnus
  resources :support
  resources :meetings
  resources :messages
  get 'attendances/upload' => 'attendances#upload' # have to specify upload route, otherwise rails thinks it's an id for show.
  post 'attendances/upload_action' => 'attendances#upload_action' # have to specify upload route, otherwise rails thinks it's an id for show.
  resources :attendances
  get 'service_points/upload' => 'service_points#upload' # have to specify upload route, otherwise rails thinks it's an id for show.
  post 'service_points/upload_action' => 'service_points#upload_action' # have to specify upload route, otherwise rails thinks it's an id for show.
  resources :service_points
  # for rspec oauth redirect - ** DO NOT DELETE **
  get '/o/oauth2/auth', to: redirect('/users/auth/google_oauth2')

  root 'landing#index'
end
