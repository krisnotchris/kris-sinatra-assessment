class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :name
      t.string :weight
      t.string :sets
      t.string :reps
    end
  end
end
