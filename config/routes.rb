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

  post 'users/friends/:id', to: 'users#friends'
  post 'users/add_friend/:id', to: 'users#add_friend'
  post 'users/remove_friend/:id', to: 'users#remove_friend'
  post 'users/stories/:id', to: 'users#stories'
  post 'users/comments/:id', to: 'users#comments'

  post 'lobbies/join/:id', to: 'lobbies#join'
  post 'lobbies/leave/:id', to: 'lobbies#leave'
  post 'lobbies/search/:query', to: 'lobbies#search'
  post 'lobbies/members/:id', to: 'lobbies#members'
  post 'lobbies/rename/:id', to: 'lobbies#rename'
  post 'lobbies/complete/:id', to: 'lobbies#complete'
  post 'lobbies/abandon/:id', to: 'lobbies#abandon'
  post 'lobbies/edit_password/:id', to: 'lobbies#edit_password'
  post 'lobbies/append_story/:id', to: 'lobbies#append_story'
  post 'lobbies/select_story/:id', to: 'lobbies#select_story'

  post 'stories/retrieve/', to: 'stories#retrieve'
  post 'stories/like/:id', to: 'stories#like'
  post 'stories/display/:id', to: 'stories#display'

  get 'library_comments/retrieve/:story_id', to: 'library_comments#retrieve'

  get 'chat_messages/retrieve/:connection_id', to: 'chat_messages#retrieve'



  #get 'users', to: 'users/users#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
