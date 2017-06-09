Rails.application.routes.draw do

  mount API::Base, at: "/"
  mount GrapeSwaggerRails::Engine, at: "/documentation"

  root 'home#index'

  get 'home/index'

  get 'home/sites'

  get 'home/about'

  get 'home/contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
