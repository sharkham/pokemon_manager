class UserController < ApplicationController

  # Signing up

  get "/signup" do
    erb :signup
  end

  post "/signup" do
    user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
    if user.save
      #find that thing that validates the things.
      #redirect to user being logged in
    else
      redirect "/signup"
      #one example redirects to failure; it would be better to go to sign-up again but with an error
    end
  end

  # Logging in

end
