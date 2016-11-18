Rails.application.routes.draw do
  get '/', to: 'site#home'
  get "/text_inspections/new", to: "text_inspections#new"
  get "/asciis/new", to: "asciis#new"
  post "/asciis/create", to: "text_inspections#create"
  post "/text_inspections/create", to: "text_inspections#create"
  get "/text_inspections/results/:text/:count", to: "text_inspections#results"
  get "/ipsum/new", to: "ipsum#new"
  post "/ipsum/create", to: "ipsum#create"
end
