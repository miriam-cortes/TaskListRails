Rails.application.routes.draw do

  root to: 'tasks#index'

  get 'tasks/index', as: 'index'

  get 'tasks/new' => 'tasks#new', as: 'new'
  post 'tasks/create' => 'tasks#create', as: 'create'

  get 'tasks/show/:id' => 'tasks#show', as: 'show'

  delete 'tasks/:id/delete' => 'tasks#delete', as: 'delete'
# can this be /delete?? yes, but it's not convention so definitely don't do it for models

  get 'tasks/:id/edit' => 'tasks#edit', as: 'edit'
  get 'tasks/:id/update' => 'tasks#update', as: 'update'

  post 'tasks/:id/mark_complete' => 'tasks#mark_complete', as: 'mark_complete'

  post 'tasks/:id/mark_incomplete' => 'tasks#mark_incomplete', as: 'mark_incomplete'
end
