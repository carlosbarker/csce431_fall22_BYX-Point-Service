Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :members, controllers:
  {
    omniauth_callbacks: 'members/omniauth_callbacks',
    sessions: 'members/sessions',
    registrations: 'members/registrations'
  }

  # devise_for :member, controllers: { omniauth_callbacks: 'member/omniauth_callbacks' }
  
  # Routes for Google authentication
  # get 'auth/:provider/callback', to: 'sessions#googleAuth'
  # get 'auth/failure', to: redirect('/')

  #devise_scope :member do
  #  get 'member/login', to: 'member/sessions#new', as: :new_member_session
  #  get 'member/logout', to: 'member/sessions#destroy', as: :destroy_member_session
  #end

  # get 'admin', action: :index, controller: :admin
  get 'member', action: :index, controller: :member

  resources :member
  resources :login_landing

  root 'members#index'
end
