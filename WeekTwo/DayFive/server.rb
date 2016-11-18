require 'sinatra'
require 'pry'
require 'sinatra/reloader'
require 'json'
require './lib/models/movie_searcher'
require 'imdb'


enable :sessions
searcher = MovieSearcher.new("MySearcher")

get "/" do
  erb(:home)
end
post "/search/:criteria" do
  content_type :json
  searcher.search_movie(params[:criteria]).to_json
  #binding.pry
end
