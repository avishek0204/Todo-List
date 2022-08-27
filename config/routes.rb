Rails.application.routes.draw do
  root "users#index"
  

  # todos routes 
  get '/todos', action: :index, controller: 'todos'
  get 'todos/new', action: :new, controller: 'todos'
  post '/todos/new', action: :create_todo, controller: 'todos'
  get '/todos/:id', action: :show, controller: 'todos'
  get '/todos/:id/edit', action: :edit_todo, controller: 'todos'
  patch '/todos/:id/edit', action: :update_todo, controller: 'todos'
  delete '/todos/:id', action: :destroy, controller: 'todos'
  patch '/todos/:id/mark', action: :mark_completed, controller: 'todos'


  # user routes 
  get '/signup', action: :new, controller: 'users'
  post '/signup', action: :create_user, controller: 'users'
  get '/users/:id/edit', action: :edit_user, controller: 'users'
  patch '/users/:id/edit', action: :update_user_details, controller: 'users'
  get '/users/:id', action: :show_user_details, controller: 'users'
  get '/users', action: :all_users, controller: 'users'
  delete '/users/:id', action: :destroy, controller: 'users'


  get '/login', action: :new, controller: 'sessions'
  post '/login', action: :create, controller: 'sessions'
  delete '/logout', action: :destroy, controller: 'sessions'


  
  get ':not_found', action: :invalid_url, controller: 'todos'

  resources :userfk

end
