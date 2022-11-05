Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :members, controllers:
  {
    omniauth_callbacks: 'members/omniauth_callbacks',
    sessions: 'members/sessions',
    registrations: 'members/registrations'
  }

  # devise_scope :member do
  #   get 'members/sign_in', to: 'members/sessions#new', as: :new_member_session
  #   get 'members/sign_out', to: 'members/sessions#destroy', as: :destroy_member_session
  # end

  get 'members', action: :index, controller: :members

  resources :landing  # can maybe remove?
  # resources :admin_dash  # may not need to add this as a resource since it's hidden

  root 'landing#index'
end
