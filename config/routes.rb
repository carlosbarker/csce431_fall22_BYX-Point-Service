Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :members, controllers:
  {
    omniauth_callbacks: 'members/omniauth_callbacks',
    sessions: 'members/sessions',
    registrations: 'members/registrations'
  }

  get 'members', action: :index, controller: :members

  resources :members
  resources :member_dash
  resources :admin_dash
  resources :login_landing

  root 'member_dash#index'
  # will redirect to login page since member_dash is restricted
end
