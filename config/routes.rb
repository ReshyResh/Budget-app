Rails.application.routes.draw do
  devise_for :users
  root 'categories#index'
  get '/unauthorized' => 'categories#unauthorized'
  get '/splash' => 'users#index'
  devise_scope :user do
    get '/sign-in' => "devise/sessions#new", :as => :login
  end
  resources :users, only: [:index]
  resources :categories, only: [:index, :new, :show, :create, :destroy] do
    resources :transactions, only: [:index, :create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
