Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'app#index'

  get '/login', to: 'user#login_page'
  post '/login', to: 'user#login'
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

  get '/admin', to: 'admin#index'
  get '/admin/users', to: 'admin#users'
  get '/admin/administrators', to: 'admin#administrators'
  get '/admin/users/delete/:id(.:format)', to: 'admin#user_delete', as: :admin_user_delete
  get '/admin/news', to: 'admin#news'
  get '/admin/posts/delete/:id(.:format)', to: 'admin#post_delete', as: :admin_post_delete
end
