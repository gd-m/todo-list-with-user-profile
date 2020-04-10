Rails.application.routes.draw do
  
  post '/api/v1/signup', to: 'users#create'
  post '/api/v1/login', to: 'sessions#create'
  delete '/api/v1/logout', to: 'sessions#destroy'
  get '/api/v1/sessions', to: 'sessions#get_current_user'
  
  resources :users 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
