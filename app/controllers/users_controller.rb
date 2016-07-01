class UsersController < ApplicationController

  get '/signup' do 
    if logged_in?
      redirect '/workouts'
    else
      erb :'/users/signup'
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:password] == ""
      redirect '/signup'
    else
      @user = User.new(params[:user])
      @user.save
      session[:user_id] = @user.id
      
      redirect '/workouts'
    end
  end

  post '/login' do 
    @user = User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/workouts'
    else
      redirect '/'
    end
  end

end