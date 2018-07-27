Rails.application.routes.draw do
  resources :users, only: [:show, :new, :edit, :create, :update]
  resources :sessions, only: [:new, :create, :destroy]
  resources :communities
  resources :communities do
  	post 'add' => 'joins#create'
  	delete 'delete' => 'joins#destroy'
  end

  match 'signup', to: 'users#new', via: 'get'
  match 'signin', to: 'sessions#new', via: 'get'
  match 'signout', to: 'sessions#destroy', via: 'delete'

  root 'users#index'
  get 'rooms/show'
end
