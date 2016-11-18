Rails.application.routes.draw do
  get '/', to: 'site#index'
  post '/login', to:'site#login'
  get '/movies', to: 'movies#movies'
  get '/movies/save/:id', to: 'movies#save'
  get '/movies/details/:id', to: 'movies#details'
  get '/users/details/:id', to: 'users#details'
  post '/comments', to:'comments#create'
  get '/search', to: 'search#results'

end
