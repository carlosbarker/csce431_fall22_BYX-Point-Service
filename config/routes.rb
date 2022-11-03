Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #resources :byx_frontend
  # root to: 'pages#landing'
  # get "landing" => "pages#landing"
  # get "index" => "pages#index"
  # get "utilities_color" => "pages#utilities_color"
  # get "utilities_animation" => "pages#utilities_animation"
  # get "register" => "pages#register"
  # get "tables" => "pages#tables"
  # get "utilities_border" => "pages#utilities_border"
  # get "utilities_other" => "pages#utilities_other"
  # get "error_page_not_found" => "pages#error_page_not_found"
  # get "blank" => "pages#blank"
  # get "buttons" => "pages#buttons"
  # get "cards" => "pages#cards"
  # get "charts" => "pages#charts"
  # get "forgot_password" => "pages#forgot_password"
  # get "login" => "pages#login"

  devise_for :member, controllers: { omniauth_callbacks: 'admin/omniauth_callbacks' }
  
  devise_scope :admin do
    get 'admin/login', to: 'admin/sessions#new', as: :new_admin_session
    get 'admin/logout', to: 'admin/sessions#destroy', as: :destroy_admin_session
  end

  devise_scope :member do
    get 'member/login', to: 'member/sessions#new', as: :new_member_session
    get 'member/logout', to: 'member/sessions#destroy', as: :destroy_member_session
  end

  get 'admin', action: :index, controller: :admin

  resources :admin

  root 'admin#index'
end
