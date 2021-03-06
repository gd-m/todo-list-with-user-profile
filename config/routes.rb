Rails.application.routes.draw do
  
  post '/api/v1/signup', to: 'api/v1/users#create'
  post '/api/v1/login', to: 'api/v1/sessions#create'
  delete '/api/v1/logout', to: 'api/v1/sessions#destroy'
  get '/api/v1/sessions', to: 'api/v1/sessions#get_current_user'
  
  resources :users 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
