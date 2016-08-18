Rails.application.routes.draw do
  resources :user_tasks

  get '/auth/:provider/callback' => 'session#create'

  get '/signout' => 'session#destroy', as: :signout

  root 'user_tasks#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
