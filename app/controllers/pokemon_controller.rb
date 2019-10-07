class PokemonController < ApplicationController

  #All Pokémon
  get '/pokemon/all' do
    if logged_in?
      @pokemon = Pokemon.all
      erb :'pokemon/index'
    else
      redirect '/login'
    end
  end

  #Any user's Pokémon
  get '/pokemon/:slug' do
    if logged_in?
      @user = User.find_by_slug(params[:slug])
      if @user == current_user
        redirect '/pokemon'
      else
        @pokemon = @user.pokemons
        erb :'pokemon/index' #or should it be users/show?
      end
    else
      redirect '/login'
    end
  end

  #Logged-in user's Pokémon
  get '/pokemon' do
    if logged_in?
      @user = current_user
      @pokemon = @user.pokemons

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

  #Read

  #Edit

  #Destroy

end
