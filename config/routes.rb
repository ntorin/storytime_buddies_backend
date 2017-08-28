Rails.application.routes.draw do
  resources :chat_messages
  resources :library_comments
  resources :lobby_messages
  resources :lobbies
  resources :stories
  devise_for :users

  namespace :api do
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
      mount API::V1::Lobbies, at: 'lobbies'
    end
  end
  resources :users
  mount API::Base, at: "/"
  mount GrapeSwaggerRails::Engine, at: "/documentation", as: 'apidocs'
  mount ActionCable.server => '/cable'


  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'register', to: 'devise/registrations#new'
  end

  root 'home#index'

  get 'home/index'

  post 'lobbies/join/:id', to: 'lobbies#join'
  post 'lobbies/leave/:id', to: 'lobbies#leave'
  post 'lobbies/search/:query', to: 'lobbies#search'
  post 'lobby_messages/send', to: 'lobbymessages#send'

  #get 'users', to: 'users/users#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
