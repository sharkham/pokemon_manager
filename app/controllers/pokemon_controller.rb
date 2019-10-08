class PokemonController < ApplicationController

  #Read - All Pokémon
  get '/pokemon' do
    if logged_in?
      @pokemon = Pokemon.all
      @user = current_user
      erb :'pokemon/index'
    else
      redirect '/login'
    end
  end

  #Create
  get '/pokemon/new' do
    if logged_in?
      @user = current_user
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

  #Read - Individual Pokémon (show)
  get '/pokemon/:id' do
    if logged_in?
      @pokemon = Pokemon.find_by_id(params[:id])
      if @pokemon
        @user = current_user
        erb :'pokemon/show'
      else
        redirect '/pokemon'
      end
    else
      redirect '/login'
    end
  end


  #Edit
  get '/pokemon/:id/edit' do
    if logged_in?
      @user = current_user
      pokemon_user = Pokemon.find_by_id(params[:id]).user
      if pokemon_user.id == @user.id
        @pokemon = Pokemon.find_by_id(params[:id])
        erb :'pokemon/edit'
      else
        flash[:err] = "You can't edit someone else's Pokémon."
        redirect "/pokemon"
      end
    else
      redirect '/login'
    end
  end

  #Update
  patch '/pokemon/:id' do
    pokemon_user = Pokemon.find_by_id(params[:id]).user
    if pokemon_user.id == current_user.id
      @pokemon = Pokemon.find_by_id(params[:id])
      params.delete("_method")
      # ^ask what this means
      if @pokemon.update(params)
        redirect "/pokemon/#{@pokemon.id}"
      else
        redirect "/pokemon/#{@pokemon.id}/edit"
      end
    else
      #place for the flash error thing
      erb :"/pokemon/index"
    end
  end

  #Destroy
  delete '/pokemon/:id' do
    pokemon_user = Pokemon.find_by_id(params[:id]).user
    if pokemon_user.id == current_user.id
      Pokemon.destroy(params[:id])
      redirect :'/pokemon'
    else
      #flash error thing
      redirect :'/pokemon'
    end
  end

end
