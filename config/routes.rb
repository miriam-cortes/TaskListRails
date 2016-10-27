Rails.application.routes.draw do
  root to: 'tasks#index'

  resources :users do
    resources :tasks
  end

  get 'sessions/create'
  delete 'sessions/destroy' => 'sessions#destroy'
  get '/auth/:provider/callback' => 'sessions#create'

  patch 'user/:user_id/task/:id/complete' => 'tasks#mark_complete', as: 'mark_complete'
  patch 'user/:user_id/task/:id/incomplete' => 'tasks#mark_incomplete', as: 'mark_incomplete'

end
