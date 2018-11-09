class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  patch '/recipes/:id/edit' do
    #binding.pry
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.update(name: params[:name], cook_time: params[:cook_time], ingredients: params[:ingredients])
    #binding.pry
    redirect "/recipes/#{@recipe.id}"
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    @recipe = Recipe.create(name: params[:name], cook_time: params[:cook_time], ingredients: params[:ingredients])
    #binding.pry
    redirect to "/recipes/#{@recipe.id}"
  end

  get "/recipes/:id" do

    #binding.pry
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  delete "/recipes/:id" do
    @recipe = Recipe.find_by_id(params[:id]).destroy
    redirect "/recipes"
  end



  get "/" do
    redirect to "/recipes"
  end

  get '/recipes' do
    @recipes = Recipe.all
    #binding.pry
    erb :index
  end



end
