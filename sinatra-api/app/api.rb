require 'bundler/setup'
require 'sinatra/base'
require_relative 'database.rb'

class Api < Sinatra::Base

	get '/hello' do
		'Hello world!'
	end

	get '/movies' do
		db = FileDb::Database.new('data.json')
		table = db.table('movies')
		table.select.to_json
	end

	get '/movies/:id' do		
		db = FileDb::Database.new('data.json')
		table = db.table('movies')
		table.select(where: {"id" => params[:id].to_i}).to_json
	end

	get '/directors' do
		db = FileDb::Database.new('data.json')
		table = db.table('directors')
		table.select.to_json
	end

	get '/directors/:id' do		
		db = FileDb::Database.new('data.json')
		table = db.table('directors')
		table.select(where: {"id" => params[:id].to_i}).to_json
	end

	post '/movies' do
		db = FileDb::Database.new('data.json')
		table = db.table('movies')
		directors = db.table('directors')
		movie = table.insert({"title" => params[:title], "year" => params[:year].to_i, "director_id" => params[:director_id].to_i})
		redirect to("/movies/#{movie['id']}")
	end

	post '/directors' do 
		db = FileDb::Database.new('data.json')
		directors = db.table('directors')
		director = directors.insert({"name" => params[:name]})
		redirect to("/directors/#{director['id']}")
	end

	delete ''

end
