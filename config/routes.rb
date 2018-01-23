Rails.application.routes.draw do
  root 'repositories#index'

  resources :repositories do
    resources :items, only: [:show, :new, :create, :destroy]
  end
end
