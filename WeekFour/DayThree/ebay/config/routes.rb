Rails.application.routes.draw do
  get '/', to: 'site#index'
  post '/login', to:'site#login'
  #users
  get '/users', to: 'users#index'
  get '/users/new', to: 'users#new'
  get '/users/delete/:id', to: 'users#delete'
  post '/users', to:'users#create'
  #products
  get '/products', to: 'products#index'
  get '/products/new', to: 'products#new'
  get '/products/details/:id', to: 'products#details'
  get '/products/delete/:id', to: 'products#delete'
  post '/products', to:'products#create'
  #bid
  post '/bids', to:'bids#create'
end
