class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get "/recipes/new" do
    # binding.pry
    erb :new
  end
  
  get "/recipes" do
    @recipes = Recipe.all
    # binding.pry
    erb :index
  end

  post "/recipes" do
    @recipe = Recipe.new(params)

    @recipe.save
    # binding.pry
    redirect "/recipes/#{Recipe.last.id}"
  end

  get "/recipes/:id" do
    @recipe = Recipe.find_by_id(params[:id])
    # binding.pry
    erb :show
  end

  get "/recipes/:id/edit" do
    @recipe = Recipe.find_by_id(params[:id])
    # binding.pry
    erb :edit
  end

  patch "/recipes/:id" do
    Recipe.update(params[:id], name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    @recipe = Recipe.find_by_id(params[:id])
    # binding.pry
    erb :show
  end

  delete "/recipes/:id" do
    Recipe.delete(params[:id])
    # binding.pry
    redirect "/recipes"
  end
end
