class JobsController < ApplicationController
  protect_from_forgery with: :null_session

  def search_job
    
    if params[:company_name].present?
      @jobs = Job.where("company_name LIKE ?", "%#{params[:company_name]}%")
      render json: @jobs, status: 200
    else
      render json: { error: 'Search term not provided' }, status: 400
    end
  end



  def index
    @job = Job.all
    render json: @job, status: 200
  end

  def show
   @job = Job.find(params[:id])
   render json: @job, status: 200
  end



  def create
    @job = Job.new(jobs_params)
    if @job.save 
      render json: @job, status: :created
    else
      render json: { errors: @job.errors.full_messages }, status: 422
    end
  end

  


  def update
    @job = Job.find(params[:id])
    @job.update(jobs_params)
    render json: @job, status: 200
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    render json: @job, status: 204
  end

  private
  def jobs_params
    params.permit(:company_name, :min_salary, :max_salary, :address, :city)
  end

end


