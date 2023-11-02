ActiveAdmin.register Post do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment

  permit_params :title, :body, :user_id, :image
  filter :title
  filter :user_id

  form partial: 'form'
  show do
    attributes_table do
      row :title
      row :body
      row :image do |post|
        image_tag post.image_url if post.image?
      end
    end
  end    
    

    
    

  # form do |f|
  #   f.inputs 'Details' do
  #     f.input :title
  #     f.input :body
  #     f.input :user_id
  #     f.input :image, as: :file
  #   end
  #   f.actions
  # end


end

## 