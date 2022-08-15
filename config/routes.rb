Rails.application.routes.draw do
  root "todos#index"
  get '/todos', to: redirect('/')

  get 'todos/new', action: :new, controller: 'todos'
  post '/', action: :create_todo, controller: 'todos'
  get '/todos/:id', action: :show, controller: 'todos'
  get '/todos/edit/:id', action: :edit_todo, controller: 'todos'
  post '/todos/:id', action: :update_todo, controller: 'todos'
  delete '/todos/:id', action: :destroy, controller: 'todos'

end
