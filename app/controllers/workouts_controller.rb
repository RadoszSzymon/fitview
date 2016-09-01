class WorkoutsController < ApplicationController
    before_action :find_training, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]
    
    def index
        @workouts = current_user.present? ? current_user.workouts.all : []
    end
    
    def show
        #if current_user.sex == "Male"
            #if @workout.intensity == "High"
            #    @calories = (((current_user.age * 0.2017) - (current_user.weight * 0.09036) + (165 * 0.6309) - 55.0969) * @workout.length / 4.184).round(2)
           # elsif @workout.intensity == "Normal"
           #     @calories = (((current_user.age * 0.2017) - (current_user.weight * 0.09036) + (145 * 0.6309) - 55.0969) * @workout.length / 4.184).round(2)
           # elsif @workout.intensity == "Low"
           #     @calories = (((current_user.age * 0.2017) - (current_user.weight * 0.09036) + (125 * 0.6309) - 55.0969) * @workout.length / 4.184).round(2) 
           # end
        #else
          #  if @workout.intensity == "High"
          #      @calories = (((current_user.age * 0.074) - (current_user.weight * 0.05741) + (165 * 0.4472) - 20.4022) * @workout.length / 4.184).round(2)
          #  elsif @workout.intensity == "Normal"
          #      @calories = (((current_user.age * 0.074) - (current_user.weight * 0.05741) + (145 * 0.4472) - 20.4022) * @workout.length / 4.184).round(2)
          #  elsif @workout.intensity == "Low"
          #      @calories = (((current_user.age * 0.074) - (current_user.weight * 0.05741) + (125 * 0.4472) - 20.4022) * @workout.length / 4.184).round(2)
          #  end
       # end
    end
    
    def new 
        @workout = current_user.workouts.build
    end
    
    def create 
         @workout = current_user.workouts.build(workout_params)
         if @workout.save
             redirect_to @workout
         else
             render 'new'
         end
    end
    
    def edit 
    end
    
    def update
        if @workout.update(workout_params)
            redirect_to @workout
        else
            render 'edit'
        end
    end
    
    def destroy
        @workout.destroy
        redirect_to root_path
    end
    
    private
    
    def workout_params
        params.require(:workout).permit(:date, :workout, :comment, :mood, :length, :weather, :distance, :intensity)
    end
    
    def find_training
        @workout = Workout.find(params[:id])
    end
end
