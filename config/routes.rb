Rails.application.routes.draw do
  root 'repositories#index'

  resources :repositories do
    resources :item_files, only: [:show, :new, :create, :destroy]
    resources :item_scripts, only: [:show, :new, :create, :destroy]
  end

  mount ActionCable.server => '/cable'
end
