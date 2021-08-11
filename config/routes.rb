Rails.application.routes.draw do
  root 'tasks#index'

  resources :users, only: [:create]
  resources :tasks do
    resources :task_memberships, only: %i[new create]
    resources :comments, only: %i[new create]
  end
end
