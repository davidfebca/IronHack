Rails.application.routes.draw do
  get '/', to: 'home#index'
  #concerts
  get '/concerts', to:'concerts#index'
  get '/concerts/details/:id', to:'concerts#details'
  get '/concerts/new', to:'concerts#new'
  get '/concerts/delete/:id', to:'concerts#delete'
  post '/concerts', to:'concerts#create'
  #cities
  get '/cities', to:'cities#index'
  get '/cities/new', to:'cities#new'
  get '/cities/delete/:id', to:'cities#delete'
  post '/cities', to:'cities#create'
  #artist
  get '/artists', to:'artists#index'
  get '/artists/delete/:id', to:'artists#delete'
  get '/artists/new', to:'artists#new'
  post '/artists', to:'artists#create'
  #comments
  post '/comments', to:'comments#create'

  #filters
  get '/filter/by-price', to: 'tools#price'
  get '/filter/most-commented', to: 'tools#commented'
end
