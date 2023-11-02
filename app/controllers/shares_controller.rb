class SharesController < ApplicationController

   def index
    @share = Share.all
    render json: @share, status: :ok
   end
   
   def show
    @share = Share.find(params[:id])
    render json: @share, status: :ok
   end
    
    def create
      @share = Share.create!(share_params)
          
      if @share.save
        response_data = {}
         
        if @share.description
          response_data[:description] = @share.description
        end

        if @share.image.attached?
          response_data[:image_url] = rails_blob_url(@share.image)
        end
        
        if @share.video.attached?
          response_data[:video_url] = rails_blob_url(@share.video)
        end
        
        if @share.document.attached?
          response_data[:document_url] = rails_blob_url(@share.document)
        end
        
        if @share.audio_data.attached?
          response_data[:audio_url] = rails_blob_url(@share.audio_data)
        end
        response_data[:likes_count] = @share.likes_count  
        render json: response_data, status: :created
      else
        render json: { error: 'Failed to upload' }, status: :unprocessable_entity
      end
    end

      
        
    def share
      @post_share = PostShare.new(share_id: params[:share_id], user_id: params[:user_id])
      if @post_share.save
        render json: @post_share, status: :created
      else
        render json: @post_share.errors, status: :unprocessable_entity
      end
    end     

    
    private
      def share_params
        params.permit(:description, :image, :video, :document, :audio_data)
      end

end

