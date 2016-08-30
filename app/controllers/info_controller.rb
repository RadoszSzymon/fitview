class InfoController < ApplicationController

    before_filter :about
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
        if current_user.activity == "Sedentary"
            if current_user.goals == "Lose Weight"
                @diet_calories = ((@bmr * 1.1) - 300).to_i
            elsif current_user.goals == "Maintain Weight"
                @diet_calories = (@bmr * 1.1).to_i
            elsif current_user.goals == "Add some weight"
                @diet_calories = ((@bmr * 1.1) + 300).to_i
            end
        elsif current_user.activity == "Low"
            if current_user.goals == "Lose Weight"
                @diet_calories = ((@bmr * 1.5) - 300).to_i
            elsif current_user.goals == "Maintain Weight"
                @diet_calories = (@bmr * 1.5).to_i
            elsif current_user.goals == "Add some weight"
                @diet_calories = ((@bmr * 1.5) + 300).to_i
            end
        elsif current_user.activity == "Medium"
            if current_user.goals == "Lose Weight"
                @diet_calories = ((@bmr * 1.7) - 300).to_i
            elsif current_user.goals == "Maintain Weight"
                @diet_calories = (@bmr * 1.7).to_i
            elsif current_user.goals == "Add some weight"
                @diet_calories = ((@bmr * 1.7) + 300).to_i
            end
        elsif current_user.activity == "High"
            if current_user.goals == "Lose Weight"
                @diet_calories = ((@bmr * 2.1) - 300).to_i
            elsif current_user.goals == "Maintain Weight"
                @diet_calories = (@bmr * 2.1).to_i
            elsif current_user.goals == "Add some weight"
                @diet_calories = ((@bmr * 2.1) + 300).to_i
            end
        end
    end
end
