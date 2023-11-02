class EmployeeAttendanceController < ApplicationController

  def create
    @attendance = EmployeeAttendance.new(attendance_params)
    if @attendance.save
      render json: @attendance, status: 200
    else
      render json: { errors: @attendance.errors.full_messages}, status: 422
    end
  end



  def calculate_hours
    start_date = Date.parse(params[:start_date])
    end_date = Date.parse(params[:end_date])
    employee_id = params[:employee_id]
    if end_date <= Date.today
        employee_attendances = EmployeeAttendance.where(
        employee_id: employee_id,
        date: start_date..end_date
        )
      
        office_hours = employee_attendances.where(attendence: 'present', mode_of_work: 'wfo').sum(:working_hours)
        wfh_hours = employee_attendances.where(attendence: 'present', mode_of_work: 'wfh').sum(:working_hours)
        total_hours = office_hours + wfh_hours
      
        render json: {
          office_hours: office_hours,
          wfh_hours: wfh_hours,
          total_hours: total_hours
        }
    else
      render json: { error: "end_date can not be future date" }, status: status
    end
   end




  private

  def attendance_params
    params.permit(:date, :attendence, :mode_of_work, :working_hours, :employee_id)
  end

  
end
