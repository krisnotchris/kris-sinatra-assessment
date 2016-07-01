class WorkoutsController < ApplicationController
  get '/workouts' do  
    erb :'/workouts/workouts'
  end
end