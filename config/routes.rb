Rails.application.routes.draw do
 # get 'posts/index'

  #get 'posts/new'

  #get 'posts/edit'

  #get 'posts/show'

  #get 'categories/index'

 # get 'categories/new'

  #get 'categories/edit'

  #get 'categories/show'

 # get 'homes/index'

  devise_for :users
  # devise_for :users, controllers: {
   # sessions: 'users/sessions'
  #}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "posts#index"
  resources :categories
  resources :posts
end
