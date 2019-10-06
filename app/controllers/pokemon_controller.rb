class PokemonController < ApplicationController

  #Index
  get ':slug/pokemon' do
    if logged_in?
      @user = User.find_by_slug(params[:slug])
      @pokemon = @user.pokemon
      erb :'pokemon/index' #or should it be users/show?
    else
      redirect '/login'
    end
  end

  #Create

  #Read

  #Edit

  #Destroy

end
