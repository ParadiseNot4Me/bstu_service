class Api::V1::ProgressController < Api::V1::Base::BaseAuthorizableController

	def show
		schedule_field_id = params[:schedule_field_id]
		group_id = params[:group_id]
		date = params[:date].to_datetime 

		students_in_group = Student.where(group_id: group_id)


		if(ScheduleField.find(schedule_field_id).lesson_day.n != date.wday)
			rescue_not_found_custom("Занятие с указанными данными не нийдено")
			return
		end

		progresses = Array.new
		students_in_group.each do |student|
			progress = StudentProgress.find_by(date: date, 
				student_id: student.id, 
				schedule_field_id: schedule_field_id)

			if(progress == nil)
				progress = StudentProgress.new(date: date, 
				student_id: student.id, 
				schedule_field_id: schedule_field_id,
				group_id: group_id)

				progress.save
			end 

			progresses << progress

		end

		render json: progresses
	end

	def update
		schedule_field_id = params[:schedule_field_id]
		group_id = params[:group_id]
		date = params[:date].to_datetime 

		params[:data].each do | updateable_field |
			field = StudentProgress.find(updateable_field[:id])
			field.mark = updateable_field[:mark]
			field.intime = updateable_field[:intime]
			field.attendance = updateable_field[:attendance]
			field.save
		end

		render json: { status: "data update succsessful" }
	end


end
