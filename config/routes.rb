Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions' }
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
