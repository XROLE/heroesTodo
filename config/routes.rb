Rails.application.routes.draw do
  get 'welcome/index'

  get 'sessions/new'
  get 'sessions/index'
  get 'sessions/create'
  get 'sessions/destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users
  resources :todos
  resources :sessions, only: [:create, :destroy]
  root 'welcome#index'
end
