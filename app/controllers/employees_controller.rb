class EmployeesController < ApplicationController

  def index
    @employee = Employee.all
    render json: @employee
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      render json: @employee, status: 200
    else 
      render json: { errors: @employee.errors.full_messages}, status: 422
    end
  end


  private
    def employee_params
       params.permit(:name, :email)
    end


end
