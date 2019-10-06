class PokemonController < ApplicationController

  #Index
  get '/pokemon' do
    if logged_in?
      @user = current_user
      @pokemon = current_user.pokemon
      erb :'pokemon/index'
    else
      redirect '/login'
    end
  end

  #Create

  #Read

  #Edit

  #Destroy

end
