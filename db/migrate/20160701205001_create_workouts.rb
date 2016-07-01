class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :name
      t.integer :weight
      t.integer :reps
      t.integer :user_id
    end
  end
end
