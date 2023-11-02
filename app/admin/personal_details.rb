ActiveAdmin.register PersonalDetail do
  permit_params :phone_number, :email, :gender, :dob, :marital_status, :blood_group, :image, :video, :hobbies, :work_experiences, :education  

  filter :gender
  filter :dob

  form do |f|
    f.inputs "Image" do
      if f.object.image.present?
        f.input :image, as: :file, hint: image_tag(f.object.image_url)
      else
        f.input :image, as: :file
      end
    end


  # f.inputs "Video" do
  #   if f.object.video.attached?
  #     f.input :video, as: :file, hint: video_tag(f.object.video_url, controls: true)
  #   else
  #     f.input :video, as: :file
  #   end
  # end

    f.inputs "Profile Information" do
      # f.input :phone_number
      f.input :phone_number, input_html: { maxlength: 10}  # Set the maximum length to 10 digits

      f.input :email
      f.input :gender
      # f.input :dob, as: :datepicker, datepicker_options: { max_date: Date.today }
      # f.input :dob, as: :date_select, start_year: 1980, end_year: Date.today.year, max: Date.today.day

      # datepicker_options = { dateFormat: "dd/mm/yy", change_year: true, change_month: true, year_range: "#{1920}:#{Time.now.year}", max_date: "+0D" }
      # f.input :dob,label: "D.O.B", as: :datepicker, datepicker_options: datepicker_options

      datepicker_options = {
        dateFormat: "MM dd yy",    
        change_year: true,
        change_month: true,
        year_range: "#{1920}:#{Time.now.year}",
        max_date: "+0D"
      }
      f.input :dob, label: "D.O.B", as: :datepicker, datepicker_options: datepicker_options
      

      f.input :marital_status
      f.input :blood_group,  as: :searchable_select, collection: ['A+', 'B+', 'AB+', 'O+', 'A-', 'B-', 'AB-', 'O-']
    end 

    f.inputs "HOBBIES" do
      f.input :hobbies, as: :text, input_html: { rows: 5 } 
    end 

    f.inputs "Work Experiences" do
      f.input :work_experiences, as: :text, input_html: { rows: 5 }
    end
    f.inputs "Education" do
      f.input :education, as: :text, input_html: { rows: 5 }
    end

    f.actions
  end

  show do
    panel "Image" do
      if resource.image.present?
        image_tag resource.image_url
      else
        "No image available"
      end
    end
    # panel "Video" do
    #   if resource.video.attached?
    #     link_to "Video Filename: #{resource.video.filename}"
    #     link_to "Video URL", rails_blob_path(resource.video, disposition: "attachment"), target: "_blank"
    
    #   else
    #     "No video available"
    #   end
    # end
    attributes_table do
      row :phone_number
      row :email
      row :gender
      row :dob
      row :marital_status
      row :blood_group
    end
    panel "Hobbies" do
      ul do
        resource.hobbies.split(',').each do |hobby|
          li hobby.strip 
        end
      end
    end

    panel "Work Experiences" do
      ul do
        resource.work_experiences.split(',').each do |experience|
          li experience.strip 
        end
      end
    end

    panel "Education" do
      ul do
        if resource.education.present?
          resource.education.split(',').each do |education|
            li education.strip 
          end
        else
          li "No education details available" 
        end
      end
    end
  
  

  end
end












# f.inputs "WORK EXPERIENCES" do
    #   f.input :work_experiences
      
    # end 

    # f.inputs "EDUCATION" do
    #   f.input :education
      
    # end 

    # f.inputs "SKILLS" do
    #   f.input :skills
      
    # end 