class UserController < ApplicationController

  # Signing up

  get "/signup" do
    erb :'users/signup'
  end

  post "/signup" do
    user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
    if user.save
      #find that thing that validates the things.
      #redirect to user being logged in
      redirect '/'
      #currently successful
    else
      redirect "/signup"
      #one example redirects to failure; it would be better to go to sign-up again but with an error
    end
  end

  # Logging in

  get '/login' do
    erb :'users/login'
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

end
