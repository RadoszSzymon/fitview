class WorkoutsController < ApplicationController
    before_action :find_training, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]
    
    def index
        @trainings = Workout.all.order("created_at DESC")
    end
    
    def show
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
