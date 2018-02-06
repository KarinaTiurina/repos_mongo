Rails.application.routes.draw do
  root 'repositories#index'

  resources :repositories, defaults: { format: "json" } do
    resources :item_files, only: [:show, :new, :create, :destroy]
    resources :item_scripts, only: [:show, :new, :create, :destroy]
  end
end
