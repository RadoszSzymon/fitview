class InfoController < ApplicationController
    def about
        @bmi = (current_user.weight.to_f / ((current_user.height.to_f / 100) * (current_user.height.to_f / 100))).round(2)
        
        @full_distance = current_user.workouts.inject(0) { |total, training| total + training.distance } 
        
        @full_time = current_user.workouts.inject(0) { |total, training| total + training.length }
        
        if current_user.sex == "Male"
            @bmr = (current_user.weight * 10) + (current_user.height * 6.25) - (current_user.age - 5) + 5
        elsif current_user.sex == "Female"
            @bmr = (current_user.weight * 10) + (current_user.height * 6.25) - (current_user.age - 5) - 161
        end
    end

    def diet

    end
end
