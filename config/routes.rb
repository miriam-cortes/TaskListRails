Rails.application.routes.draw do
  get 'users/:id/tasks/index' => 'users#show', as: 'userindex'
  resources :users

  root to: 'tasks#index'

  get 'sessions/create'
  delete 'users/sessions/destroy' => 'sessions#destroy'
  get '/auth/:provider/callback', to: 'sessions#create'
  delete 'users/sessions/destroy' => 'sessions#destroy'

  get 'tasks/index', as: 'index'
  get 'tasks/new' => 'tasks#new', as: 'new'
  post 'tasks/create' => 'tasks#create', as: 'create'
  get 'tasks/show/:id' => 'tasks#show', as: 'show'
  delete 'tasks/:id/delete' => 'tasks#delete', as: 'delete'
  get 'tasks/:id/edit' => 'tasks#edit', as: 'edit'
  patch 'tasks/:id/update' => 'tasks#update', as: 'update'
  post 'tasks/:id/mark_complete' => 'tasks#mark_complete', as: 'mark_complete'
  post 'tasks/:id/mark_incomplete' => 'tasks#mark_incomplete', as: 'mark_incomplete'

  get "/auth/:provider/callback" => "sessions#create"
end
