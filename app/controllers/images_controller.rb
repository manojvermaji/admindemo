class ImagesController < ApplicationController
  ## image jpeg k form me rhegi to postman pr link show hone pr click krne pr image browser me open ho jaegi
  def index
    images = Image.all
    image_urls = images.map do |event|
      if event.image_file.attached?
        {
          url: rails_blob_url(event.image_file, only_path: true),
          filename: event.image_file.filename.to_s
        }
      else
        nil
      end
    end.compact # Remove nil values
  
    render json: { image_urls: image_urls }
  end
  
    


  def create
    # The `Post` model should be defined or required in this file.
    @ima = Image.new(post_params.except(:images))

    # The `save` method should be called after images have been attached.
    if @ima.save
      images = params[:post][:images]

      if images
        images.each do |image|
          @ima.images.attach(image)
        end
      end

      render json: @ima, status: :created, location: @ima
    else
      render json: @ima.errors, status: :unprocessable_entity
    end
  end

    
    
    def show
    event=Image.find(params[:id])
    image_url=rails_blob_path(event.image_file, only_path: true)
    render json: image_url

    end
   
    private
    
    def image_params
    # params.require(:image).permit(:image_file)
    params.permit(:images: []
    
    end
end