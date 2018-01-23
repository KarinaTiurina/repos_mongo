Rails.application.routes.draw do
  root 'repositories#index'

  resources :repositories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :items
end
