class AddIntensityToWorkout < ActiveRecord::Migration
  def change
    add_column :workouts, :intensity, :string
  end
end
