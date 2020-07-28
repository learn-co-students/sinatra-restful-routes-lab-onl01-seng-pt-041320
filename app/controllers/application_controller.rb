class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!

  get '/recipes/new' do
    erb :new
  end

  get '/recipes' do
    @recipes = Recipe.all

    erb :index
  end

  post "/recipes" do
    @recipe = Recipe.new(params)

    @recipe.save
    redirect "/recipes/#{Recipe.last.id}"
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])

    erb :show
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])

    erb :edit
  end

  patch '/recipes/:id' do
    Recipe.update(params[:id], name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    @recipe = Recipe.find_by_id(params[:id])

    erb :show
  end

  delete '/recipes/:id' do
    Recipe.delete(params[:id])

    redirect '/recipes'
  end

end
