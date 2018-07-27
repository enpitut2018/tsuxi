Rails.application.routes.draw do
  root   'users#index'
  get    'signup',  to: 'users#new'
  get    'signin',  to: 'sessions#new'
  get    'rooms/show'
  get    'users',   to: 'users#index'
  delete 'signout', to: 'sessions#destroy'


  resources :users, only: [:show, :new, :edit, :create, :update]
  resources :sessions, only: [:new, :create, :destroy]
  resources :communities
  resources :communities do
    post 'add' => 'joins#create'
    delete 'delete' => 'joins#destroy'
  end
end
