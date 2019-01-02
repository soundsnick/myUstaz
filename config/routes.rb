Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'app#index'

  get '/category/:id(.:format)', to: 'app#categorySubject'
  get '/login', to: 'user#login_page'
  post '/login', to: 'user#login'
  get '/universities/:id(.:format)', to: 'app#university'
  get '/logout', to: 'user#logout'
  post '/search', to: 'app#search_api', as: 'search_xhr'
  get '/search', to: 'app#search', as: 'search'
  get '/teacher/:id(.:format)', to: 'app#teacher', as: 'teacher'
  get '/rate', to: 'app#rate'
  get '/commentary/add', to: 'user#commentaryAdd'
  get '/subject/:id(.:format)', to: 'user#subject_page'
  get '/tag/add', to: 'user#tagAdd'
  get '/toplist', to: 'app#rating'
  get '/news', to: 'app#news'
end
