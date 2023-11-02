class HollydaysController < ApplicationController
  def index
    @hollydays = Hollyday.all
    render json: @hollydays, status: 200
  end

  def show
    @days = Hollyday.find(params[:id])
    render json:@days
  end

  def create
    @days = Hollyday.new(hollydays_params)
    if @days.save
      render json: @days, status: :created
    else
      render json: { errors: @days.errors.full_messages }, status: 422
    end
  end



  def update
    @days = Hollyday.find(params[:id])
    @days.update(hollydays_params)
    render json: @job, status: 200
  end

  def destroy
    @days = Hollyday.find(params[:id])
     @days.destroy
     render json: @days, status: 204
  end





  private

    def hollydays_params
      params.permit(:start_date, :end_date, :reason)
    end

end


