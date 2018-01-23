Rails.application.routes.draw do
  root 'repositories#index'

  resources :repositories do
    resources :items, only: [:new, :create, :destroy]
  end
end
