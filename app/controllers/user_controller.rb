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
      session[:user_id] = @user.id #works

      redirect '/'

    else
      redirect "/signup"
      #one example redirects to failure; it would be better to go to sign-up again but with an error
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
      redirect "/" #fix this later to redirect to Pokémon
      #currently works
    else
      redirect "/login" #fix later to give error message
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

end
