Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'app#index'

  get '/category/:id(.:format)', to: 'app#categorySubject'
  get '/login', to: 'user#login_page'
  post '/login', to: 'user#login'
  get '/register', to: 'user#register_page', as: 'register_page'
  post '/register', to: 'user#register', as: 'register'
  get '/universities/:id(.:format)', to: 'app#university'
  get '/logout', to: 'user#logout'
  get '/search', to: 'user#search', as: 'search'
  get '/teacher/:id(.:format)', to: 'app#teacher', as: 'teacher'
  get '/rate', to: 'app#rate'
  get '/commentary/add', to: 'user#commentaryAdd'
  get '/subject/:id(.:format)', to: 'user#subject_page'
  get '/tag/add', to: 'user#tagAdd'
end
