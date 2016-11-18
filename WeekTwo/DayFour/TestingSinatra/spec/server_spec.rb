require '../server.rb'
require 'rspec'
require 'rack/test'

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
    it 'Includes Im Home' do
      get '/'
      expect(last_response.body).to include("Im Home")
    end
  end
  describe 'GET /redirect' do
    it 'redirects to home' do
      get '/redirect'
      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_request.path).to eq('/')
    end
  end
end
