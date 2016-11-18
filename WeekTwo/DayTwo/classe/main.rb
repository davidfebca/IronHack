require 'sinatra'
require 'sinatra/reloader'

get '/' do
  'sdfsdf'
end
get '/about' do
  @name = "David"
  @pizzas = ["margarita","carbonara","peperoni","4 quesos", "otra"]
  erb(:about)
end
get '/time' do
  now = Time.now
  @formated = "#{now.hour}:#{now.min} #{now.day}/#{now.month}/#{now.year}"
  erb(:time)
end
get '/users/:username' do
  @username = params[:username]
  erb :user
end
get '/hours/ago/:hour' do
  hour = params[:hour].to_i
  now = Time.now
  @new_hour = now - (hour *3600)
  erb :hour
end
