class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!

  #Index Action
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  #Create Action
  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do 
    @recipe = Recipe.new(name: params["name"], ingredients: params["ingredients"], cook_time: params["cook_time"])
    @recipe.save
    erb :new
  end

  #Show Action
  get '/recipes/:id' do 
    @recipe = Recipe.find(params[:id])
    erb :show
  end


  #Delete Action
  delete '/recipes/:id' do 
    @recipe = Recipe.delete(params[:id])
  end

end
