class UserController < ApplicationController

  # Signing up

  get "/signup" do
    if logged_in?
      redirect '/'
    else
      erb :'users/signup'
    end
  end

  post "/signup" do
    @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
    if @user.save
      session[:user_id] = @user.id

      redirect '/'

    else
      flash[:err] = "Please try again."

      redirect "/signup"
    end
  end


  # Logging in

  get '/login' do
    if logged_in?
      redirect '/'
    else
      erb :'users/login'
    end
  end

  post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/"
    else
      flash[:err] = "Please try again. Note that usernames are case sensitive."
      redirect "/login"
    end
  end


  #Logout

  get '/logout' do
    if logged_in?
      session.clear
      redirect '/'
    else
      redirect '/login'
    end
  end

  #Read - Any user's Pokémon
  # add error handling for if the URL is wrong/not a user

  get '/user/:slug' do
    if logged_in?
      @size = "small"
      @user = current_user
      @trainer = User.find_by_slug(params[:slug])
      @pokemon = @trainer.pokemon
      erb :'users/show'
    else
      redirect '/login'
    end
  end

end
