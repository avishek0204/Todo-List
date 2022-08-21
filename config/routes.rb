Rails.application.routes.draw do
  root "todos#index"
  get '/todos', to: redirect('/')

  get 'todos/new', action: :new, controller: 'todos'
  post '/', action: :create_todo, controller: 'todos'
  get '/todos/:id', action: :show, controller: 'todos'
  get '/todos/:id/edit', action: :edit_todo, controller: 'todos'
  patch '/todos/:id', action: :update_todo, controller: 'todos'
  delete '/todos/:id', action: :destroy, controller: 'todos'
  patch '/todos/:id/mark', action: :mark_completed, controller: 'todos'

  get ':not_found', action: :invalid_url, controller: 'todos'

end
