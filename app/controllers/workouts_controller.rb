class WorkoutsController < ApplicationController
  get '/workouts' do 
    @user = current_user
    erb :'/workouts/workouts'
  end

  get '/workouts/new' do 
    erb :'/workouts/create_workout'
  end
end