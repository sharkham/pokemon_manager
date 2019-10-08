class PokemonController < ApplicationController

  #Read - All Pokémon
  get '/pokemon' do
    if logged_in?
      @pokemon = Pokemon.all
      erb :'pokemon/index'
    else
      redirect '/login'
    end
  end

  #Create
  get '/pokemon/new' do
    if logged_in?
      erb :'pokemon/new'
    else
      redirect '/login'
    end
  end

  post '/pokemon' do
    @pokemon = current_user.pokemon.build(params)
    if @pokemon.save
      redirect '/pokemon'
    else
      erb :"/pokemon/new"
    end
  end

  # #Read - Logged-in user's Pokémon
  # get '/pokemon' do
  #   if logged_in?
  #     @user = current_user
  #     @pokemon = @user.pokemon

  #     erb :'pokemon/index'
  #   else
  #     redirect '/login'
  #   end
  # end

  #Read - Individual Pokémon (show)
  get '/pokemon/:id' do
    @pokemon = Pokemon.find_by_id(params[:id])
    if @pokemon
      erb :'pokemon/show'
    else
      redirect '/pokemon'
    end
  end

  #Read - Any user's Pokémon
  # add error handling for if the URL is wrong/not a user
  # add a thing where users can't be named "all" or "new"
  # add a thing where username has to have at least one letter.

  #this currently works but it isn't RESTful being in this controller?
  #Having "/pokemon/:slug" was getting confused with /pokemon/:id and such
  get '/user/:slug' do
    if logged_in?
      @user = User.find_by_slug(params[:slug])
      # if @user == current_user
      #   redirect '/pokemon'
      # else
        @pokemon = @user.pokemon
        erb :'pokemon/index' #or should it be users/show?
        #maybe change this to a page that has user's name
        #and stuff too so it's not the 'pokemon/index' page but a different one.
      # end
    else
      redirect '/login'
    end
  end

  #Edit
  get '/pokemon/:id/edit' do
    pokemon_user = Pokemon.find_by_id(params[:id]).user
    if pokemon_user.id == current_user.id
      @pokemon = Pokemon.find_by_id(params[:id])
      erb :'pokemon/edit'
    else
      #this is where the flash[:err] should go
      redirect "/pokemon"
    end
  end

  #Update


  #Destroy

end
