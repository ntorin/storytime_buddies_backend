Rails.application.routes.draw do
  resources :library_comments
  resources :messages
  resources :lobbies
  resources :stories
  devise_for :users

  namespace :api do
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
    end
  end
  resources :users
  mount API::Base, at: "/"
  mount GrapeSwaggerRails::Engine, at: "/documentation", as: 'apidocs'

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'register', to: 'devise/registrations#new'
  end

  root 'home#index'

  get 'home/index'

  #get 'users', to: 'users/users#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
