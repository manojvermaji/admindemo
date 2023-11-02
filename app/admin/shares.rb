ActiveAdmin.register Share do
  permit_params :description, :likes_count, :image, :video, :document, :audio_data
 

  form do |f|
    f.inputs "description " do
      f.input :description
      # f.input :image, as: :file
      # f.input :video, as: :file
      # f.input :document, as: :file
      # f.input :audio_data, as: :file
    end

    f.inputs "Image" do
      if f.object.image.present?
        f.input :image, as: :file, hint: image_tag(f.object.image_url)
      else
        f.input :image, as: :file
      end
    end

    f.inputs "Video" do
      f.input :video, as: :file
    end

    f.inputs "document" do
      if f.object.document.attached?
        f.input :document, as: :file, hint: document_tag(f.object.document_url, controls: true)
      else
        f.input :document, as: :file
      end
    end

    f.inputs "Audio_data" do
      if f.object.video.attached?
        f.input :audio_data, as: :file, hint: audio_data_tag(f.object.audio_data_url, controls: true)
      else
        f.input :audio_data, as: :file
      end
    end
    f.actions
  end


  show do
    attributes_table do
      row :description
    end

                      # for active admin code   #   row :image do |ad|
                              #     image_tag url_for(ad.image)
                              #   end
      #the below code of carrierwawe 
      panel "Image" do
        if resource.image.present?
          image_tag resource.image_url
        else
          "No image available"
        end
      end

      attributes_table do
        row :video do |ad|  
          if ad.video.attached?
            # video_tag url_for(ad.video), controls: true
            video_tag url_for(ad.video), controls: true, class: 'custom-video'
          else
            "No video available"
          end
        end
      end


      attributes_table do
        row :audio_data do |ad|  
          if ad.audio_data.attached?
            audio_tag url_for(ad.audio_data), controls: true
          else
            "No video available"
          end
        end
      end

      panel "document" do
        if resource.document.attached?
          link_to "document Filename: #{resource.document.filename}"
          link_to "document URL", rails_blob_path(resource.document, disposition: "attachment"), target: "_blank"
        else
          "No document available"
        end
      end


  end

end
