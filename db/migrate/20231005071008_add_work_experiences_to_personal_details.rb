class AddWorkExperiencesToPersonalDetails < ActiveRecord::Migration[7.0]
  def change
    add_column :personal_details, :work_experiences, :text
  end
end
