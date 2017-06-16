Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions' }
  mount API::Base, at: "/"
  mount GrapeSwaggerRails::Engine, at: "/documentation"

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
  end

  root 'home#index'

  get 'home/index'

  get 'home/sites'

  get 'home/about'

  get 'home/contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
