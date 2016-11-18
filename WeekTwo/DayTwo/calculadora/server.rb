require 'sinatra'
require 'sinatra/reloader'
require './lib/calculator.rb'
require 'pry'
enable :sessions
get "/" do
  erb(:index)
end
post "/calculate" do
  first = params[:first_number].to_f
  second = params[:second_number].to_f
  if(first == 0 || second == 0)
    return "The numbers must be > 0"
  end
  result = nil
  operator = ""
  response = ""
  case params[:operation]
    when "addition"
      result = Calculator.add(first,second)
      operator = "+"
    when "substract"
      result = Calculator.substract(first,second)
      operator = "-"
    when "multiply"
      result = Calculator.mulitply(first,second)
      operator = "*"
    when "divide"
    result = Calculator.divide(first,second)
    operator = "/"
    when "count"
      result = Calculator.count(first.to_i)
    when "timezone"
      result = Calculator.timezone(params[:zone])
    else
    "No operation gived"
  end
  response =   "#{first} #{operator} #{second} = #{result}"
  session[:result] = response
  redirect to'/result'
end
get "/result" do
  @result =  session[:result]
  erb(:result)
end
post "/save" do
  Calculator.save params[:content]
  redirect to('/')
end
