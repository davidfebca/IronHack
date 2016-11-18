require '../server'
require 'rspec'
require 'rack/test'
require ('../lib/models/blog')
require ('../lib/models/post')
require ('../lib/models/category')

describe 'Server service' do
  include Rack::Test::Methods
  def app
    Sinatra::Application
  end
  describe 'GET /' do
    it 'returns 200 Ok' do
      get '/'
    expect(last_response).to be_ok
    end
  end
  describe 'GET /categories' do
    it 'returns 200 Ok' do
      get '/categories'
    expect(last_response).to be_ok
    end
  end
  describe 'GET /authors' do
    it 'returns 200 Ok' do
      get '/categories'
    expect(last_response).to be_ok
    end
  end
  describe 'GET /new' do
    it 'returns 200 Ok' do
      get '/new'
    expect(last_response).to be_ok
    end
  end
end
