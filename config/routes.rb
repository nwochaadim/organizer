Rails.application.routes.draw do
  root 'tasks#index'

  resources :users, only: [:create]
  resources :tasks
end
