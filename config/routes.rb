Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :categories do
    resources :tasks
  end

  root to: 'categories#today'

  get '/today' => 'categories#today'
  get '/tasks' => 'categories#all_tasks'

  # get '/categories'  => 'categories#index'
  # get '/categories/new' => 'categories#new', as: 'new_category'
  # post '/categories' => 'categories#create', as: 'create_category'

  # get '/categories/:id' => 'categories#show', as: 'show_category'

  # get '/categories/:id/edit' => 'categories#edit', as: 'edit_category'
  # put '/categories/:id/' => 'categories#update', as: 'update_category'
  # delete '/categories/:id/' => 'categories#destroy', as: 'destroy_category'
  
  
  # get '/tasks'  => 'tasks#index'
  # get '/tasks/new' => 'tasks#new', as: 'new_task'
  # post '/tasks' => 'tasks#create', as: 'create_task'

  # get '/tasks/:id' => 'tasks#show', as: 'show_task'

  # get '/tasks/:id/edit' => 'tasks#edit', as: 'edit_task'
  # put '/tasks/:id/' => 'tasks#update', as: 'update_task'
  # delete '/tasks/:id/' => 'tasks#destroy', as: 'destroy_task'
end
