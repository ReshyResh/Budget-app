Rails.application.routes.draw do
  devise_for :users
  root 'categories#index'
  resources :categories, only: [:index, :new, :show, :create, :destroy] do
    resources :transactions, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
