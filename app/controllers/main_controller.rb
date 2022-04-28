class MainController < ApplicationController
	def index
		if Current.user
			start_date = params.fetch(:start_date, Date.today).to_date
			if Current.user.role == "user"
  				@appointments = Appointment.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week).and(Appointment.where(:student1 => Current.user.userid).or(Appointment.where(:student2 => Current.user.userid)).or(Appointment.where(:student3 => Current.user.userid)).or(Appointment.where(:student4 => Current.user.userid)).or(Appointment.where(:student5 => Current.user.userid)))
  			else
  				@appointments = Appointment.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week).and(Appointment.where(:tutor_id => Current.user.userid))
  			end
  		end
	end
end