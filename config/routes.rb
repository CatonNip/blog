Rails.application.routes.draw do

resources :articles
  root 'welcome#index'

resources :articles do
  resources :comments
  end

get '/login' => 'sessions#new'
post '/login' => 'sessions#create'
get '/logout' => 'sessions#destroy'

get '/signup' => 'users#new'
post '/users' => 'users#create'

end
