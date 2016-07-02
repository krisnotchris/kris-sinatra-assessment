class WorkoutsController < ApplicationController
  get '/workouts' do
    redirect_if_not_logged_in 
    @user = current_user
    @workouts = @user.workouts.all
    erb :'/workouts/workouts'
  end

  get '/workouts/new' do
    redirect_if_not_logged_in
    if logged_in? 
      erb :'/workouts/create_workout'
    else
      redirect '/'
    end
  end

  post '/workouts' do 
    @user = current_user
    @workout = @user.workouts.new
    @workout.name = params[:user][:workout][0][:name]
    @workout.weight = params[:user][:workout][0][:weight]
    @workout.sets = params[:user][:workout][0][:sets]
    @workout.reps = params[:user][:workout][0][:reps]
    @workout.save

    redirect '/workouts'
  end

  delete '/workouts/:id' do 
    @workout = Workout.find_by_id(params[:id])
    @workout.destroy
    redirect '/workouts'
  end

  get '/workouts/:id/edit' do
  redirect_if_not_logged_in 
    @workout = Workout.find_by_id(params[:id])
    erb :'/workouts/edit_workout'
  end

  patch '/workouts/:id' do 
  
    @workout = Workout.find_by_id(params[:id])
    @workout.name = params[:user][:workout][0][:name]
    @workout.weight = params[:user][:workout][0][:weight]
    @workout.sets = params[:user][:workout][0][:sets]
    @workout.reps = params[:user][:workout][0][:reps]
    @workout.save
    redirect '/workouts'
  end

end