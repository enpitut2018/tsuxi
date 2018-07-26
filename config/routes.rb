Rails.application.routes.draw do
  resources :users, only: [:show, :new, :edit, :create, :update]
  resources :sessions, only: [:new, :create, :destroy]
  resources :communities

  match 'signup', to: 'users#new', via: 'get'
  match 'signin', to: 'sessions#new', via: 'get'
  match 'signout', to: 'sessions#destroy', via: 'delete'

  root 'users#index'
  get 'rooms/show'
end
