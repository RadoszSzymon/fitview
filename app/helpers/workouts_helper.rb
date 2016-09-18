module WorkoutsHelper
	def sessions_chart_data
 		(3.weeks.ago.to_date..Date.today).map do |date|
 			{
 				date: date,
 				distance: Workout.where("date(date) = ?", date).sum(:distance)
 			}
 		end
	end

	def running_chart_data
 		(3.weeks.ago.to_date..Date.today).map do |date|
	    {
	        date: date,
	        distance: Workout.where(workout: "Running", date: date.beginning_of_day..date.end_of_day).sum(:distance)
	    }
	  end
	end

	def swimming_chart_data
 		(3.weeks.ago.to_date..Date.today).map do |date|
	    {
	        date: date,
	        distance: Workout.where(workout: "Swimming", date: date.beginning_of_day..date.end_of_day).sum(:distance)
	    }
	  end
	end

	def cycling_chart_data
 		(3.weeks.ago.to_date..Date.today).map do |date|
	    {
	        date: date,
	        distance: Workout.where(workout: "Cycling", date: date.beginning_of_day..date.end_of_day).sum(:distance)
	    }
	  end
	end
end
