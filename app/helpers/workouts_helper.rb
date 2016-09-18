module WorkoutsHelper
	def sessions_chart_data
 		(3.weeks.ago.to_date..Date.today).map do |date|
 			{
 				date: date,
 				distance: Workout.where("date(date) = ?", date).sum(:distance)
 			}
 		end
	end
end
