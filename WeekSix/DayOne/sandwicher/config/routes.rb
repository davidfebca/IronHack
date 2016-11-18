Rails.application.routes.draw do
  resources :sandwiches
  resources :ingredients
  get '/ingredients/show/:id', to: 'ingredients#show'
  get '/ingredients/destroy/:id', to: 'ingredients#destroy'
end
