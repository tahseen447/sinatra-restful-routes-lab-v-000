require_relative "../models/recipe"

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/' do
    erb :index
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index

  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
  #  puts "#{@recipe.inspect}"
    if @recipe
      erb :show
    end
  end

  get '/recipes/new' do
    erb :new
  end

post '/recipes' do
  @recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
  redirect to "/recipes/#{@recipe.id}"
end
end
