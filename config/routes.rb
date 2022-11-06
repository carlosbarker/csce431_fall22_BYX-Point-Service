Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :members, controllers:
  {
    omniauth_callbacks: 'members/omniauth_callbacks',
    sessions: 'members/sessions',
    registrations: 'members/registrations'
  }

  # get 'members', action: :index, controller: :members

  # resources define available paths. if listed here, then domain.com/resource_name WILL work, otherwise it will throw a routing error
  resources :admin
  # resources :admin_dash  # may not need to add this as a resource since it's hidden

  root 'landing#index'
end
