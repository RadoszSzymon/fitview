class WorkoutsController < ApplicationController
    before_action :find_training, only: [:show, :edit, :update, :destroy]
    
    
    def index
        @trainings = Workout.all.order("created_at DESC")
    end
    
    def show
    end
    
    def new 
        @training = Workout.new
    end
    
    def create 
         @training = Workout.new(workout_params)
         if @training.save
             redirect_to @training
         else
             render 'new'
         end
    end
    
    def edit 
    end
    
    def update
    end
    
    def destroy
    end
    
    private
    
    def workout_params
        params.require(:workout).permit(:date, :workout, :mood, :length)
    end
    
    def find_training
        @training = Workout.find(params[:id])
    end
end
