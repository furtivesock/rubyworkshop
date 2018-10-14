require 'spec_helper'
require 'rack/test'
require_relative '../app/api'

RSpec.describe Api do
 include Rack::Test::Methods

  def app
    Api.new
  end

  it 'says hello' do
    get '/hello'
    expect(last_response.body).to eq 'Hello world!'
  end

  it 'returns the list of movies' do
    get '/movies'
    expect(last_response.body).to include 'The Gold Rush'
  end

  it 'returns a specific movie' do
    get '/movies/3'
    expect(last_response.body).to include 'The General'
  end

  it 'returns the list of directors' do
    get '/directors'
    expect(last_response.body).to include 'Buster Keaton'
  end
  
  it 'returns a specific director' do
    get '/directors/1'
    expect(last_response.body).to include 'Charlie Chaplin'
  end

  it 'adds a movie' do
    post '/movies', {"title" => "The Human Centipede", "year" => 2010, "director_id" => 1}
    get '/movies/7'
    expect(last_response.body).to include 'The Human Centipede'
  end

  it 'adds a director' do
    post '/directors', {"name" => "Richard La Ruina"}
    get '/directors/4'
    expect(last_response.body).to include 'Richard La Ruina'
  end

  it 'removes a movie' do
  end

  it 'removes a director' do
  end
end
