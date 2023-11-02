ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email, :name
  #
  # or
  #
  # permit_params do
    # permitted = [:email, :name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  
end



# f.input :date, as: :datepicker
# f.input :blood_group, as: :select, collection: ['A+', 'B+', 'AB+', 'O+', 'A-', 'B-', 'AB-', 'O-']
