class AvtarsController < ApplicationController
  before_action :set_avtar, only: %i[show update destroy]

  def create
      ActiveRecord::Base.transaction do
      @avtar = Avtar.create!(avtar_params)
      if @avtar.save
        response_data = {}
        images = params[:images]
        videos = params[:videos]  

        # if images.present?  
        #   images.each do |image| 
        #     @avtar.images.attach(image)
        #   end
        #   response_data[:image_urls] = @avtar.images.map { |image| rails_blob_url(image) }
        # end


        if images.is_a?(Array)
          images.each do |image|
            @avtar.images.attach(image)
          end
          response_data[:image_urls] = @avtar.images.map { |image| rails_blob_url(image) }
        end
    
        if videos.present?  
          videos.each do |video|  
            @avtar.videos.attach(video)
          end
          response_data[:video_urls] = @avtar.videos.map { |video| rails_blob_url(video) }
        end
        # if videos.is_a?(Array)
        #   videos.each do |video|
        #     @avtar.videos.attach(video)
        #   end
        #   response_data[:video_urls] = @avtar.videos.map { |video| rails_blob_url(video) }
        # end

        render json: response_data, status: :created
      else
        render json: @avtar.errors, status: :unprocessable_entity
      end
    end
      rescue ActiveRecord::StatementInvalid => e
      render json: { error: "Database error: #{e.message}" }, status: :internal_server_error 
  end
  
  def update
    if @avtar.update!(avtar_params)
      response_data = {}
      if params[:images].present?
        images = params[:images]
        images.each do |image|
          @avtar.images.attach(image)
        end
        response_data[:image_urls] = @avtar.images.map { |image| rails_blob_url(image) }
      end
      
      if params[:videos].present?
        videos = params[:videos]
        videos.each do |videos|
          @avtar.videos.attach(videos)
        end
        response_data[:video_urls] = @avtar.videos.map { |video| rails_blob_url(video) }
      end
      render json: response_data, status: :ok
    else
      render json: @avtar.errors, status: :unprocessable_entity
    end
  end

  private

  

  def set_avtar
    @avtar = Avtar.find(params[:id])
  end

  def avtar_params
    params.permit(images: [] , videos: [])
  end
end













# def index
#   @avtars = Avtar.all
#   render json: @avtars
# end

# def show
#   render json: @avtar.as_json(include: :images).merge(
#     images: @avtar.images.map do |image|
#       url_for(image)
#     end,
#   )
# end



# def update
#   if @avtar.update(avtar_params)
#     render json: @avtar
#   else
#     render json: @avtar.errors, status: :unprocessable_entity
#   end
# end

# def destroy
#   @avtar.destroy
# end