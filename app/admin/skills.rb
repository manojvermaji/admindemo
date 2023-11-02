ActiveAdmin.register Skill do
  permit_params :name, :description, :email

  form do |f|
    f.inputs "Skill Info" do
      f.input :name
      f.input :description
      if f.object.persisted?
        f.input :email, as: :string, input_html: { readonly: true }
      else
        f.input :email, label: 'Account Email', as: :string, input_html: { value: current_admin_user.email, readonly: true }
      end
    end

    f.actions
  end

  show do
    attributes_table do
      row :name
      # row :description
      row :email

      panel "description" do
        ul do
          resource.description.split(',').each do |description|
            li description.strip 
          end
        end
      end
  
    end
  end

  controller do

    def create
      existing_skill = Skill.find_by(email: current_admin_user.email)
      
      if existing_skill
        existing_skill.update(description: params[:skill][:description])
        redirect_to admin_skill_path(existing_skill), notice: "Description updated for this skill."
      else
        super
      end
    end
    
  end


end
