class UsersController < ApplicationController


  get '/signup' do 
    if logged_in?
      redirect '/workouts'
    else
      erb :'/users/signup'
    end
  end

  post '/signup' do
    if params[:user][:username] == "" || params[:user][:password] == ""
      redirect '/signup'
    else
      @user = User.new
      @user.username = params[:user][:username]
      @user.password = params[:user][:password]
      @user.password_confirmation = params[:user][:password]
      @user.save
      session[:user_id] = @user.id
      redirect '/workouts'
    end
  end

  post '/login' do 
    @user = User.find_by(:username => params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect '/workouts'
    else
      redirect '/'
    end
  end

  get '/logout' do 
    session.clear
    redirect '/'
  end

end