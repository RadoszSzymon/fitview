class WorkoutsController < ApplicationController
    before_action :find_training, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]
    
    def index
        @trainings = Workout.all.order("created_at DESC")
    end
    
    def about
    end
    
    def show
        if current_user.sex == "Male"
            if @training.intensity == "High"
                @calories = (((current_user.age * 0.2017) - (current_user.weight * 0.09036) + (165 * 0.6309) - 55.0969) * @training.length / 4.184).round(2)
            elsif @training.intensity == "Normal"
                @calories = (((current_user.age * 0.2017) - (current_user.weight * 0.09036) + (145 * 0.6309) - 55.0969) * @training.length / 4.184).round(2)
            elsif @training.intensity == "Low"
                @calories = (((current_user.age * 0.2017) - (current_user.weight * 0.09036) + (125 * 0.6309) - 55.0969) * @training.length / 4.184).round(2) 
            end
        else
            if @training.intensity == "High"
                @calories = (((current_user.age * 0.074) - (current_user.weight * 0.05741) + (165 * 0.4472) - 20.4022) * @training.length / 4.184).round(2)
            elsif @training.intensity == "Normal"
                @calories = (((current_user.age * 0.074) - (current_user.weight * 0.05741) + (145 * 0.4472) - 20.4022) * @training.length / 4.184).round(2)
            elsif @training.intensity == "Low"
                @calories = (((current_user.age * 0.074) - (current_user.weight * 0.05741) + (125 * 0.4472) - 20.4022) * @training.length / 4.184).round(2)
            end
        end
    end
    
    def new 
        @training = current_user.workouts.build
    end
    
    def create 
         @training = current_user.workouts.build(workout_params)
         if @training.save
             redirect_to @training
         else
             render 'new'
         end
    end
    
    def edit 
    end
    
    def update
        if @training.update(workout_params)
            redirect_to @training
        else
            render 'edit'
        end
    end
    
    def destroy
        @training.destroy
        redirect_to root_path
    end
    
    private
    
    def workout_params
        params.require(:workout).permit(:date, :workout, :mood, :length, :weather, :distance, :intensity)
    end
    
    def find_training
        @training = Workout.find(params[:id])
    end
end
