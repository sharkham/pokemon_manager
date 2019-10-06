class PokemonController < ApplicationController

  #Any user's Pokémon
  get '/pokemon/:slug' do
    if logged_in?
      @user = User.find_by_slug(params[:slug])
      if @user == current_user
        redirect '/pokemon'
      else
        @pokemon = @user.pokemon
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
      @posts = current_user.posts

      erb :'pokemon/index'
    else
      redirect '/login'
  end

  #All Pokémon

  #Create

  #Read

  #Edit

  #Destroy

end
