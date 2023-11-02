ActiveAdmin.register Hollyday do

  
  permit_params :start_date, :end_date, :reason
 

  filter :start_date
  filter :end_date

    form do |f|
      f.inputs "Leave Info" do
        f.input :start_date, as: :datepicker, datepicker_options: { min_date: Date.today }
        f.input :end_date, as: :datepicker, datepicker_options: { min_date: Date.today }
        f.input :reason
      end

    if f.object.errors[:base].any?
      f.semantic_errors
        f.object.errors[:base].each do |error_message|
          div error_message, class: 'error'
      end
    end

      f.actions
    end

    show do
      attributes_table do
        row :start_date
        row :end_date
        row :reason
      end
    end
  
end

