class AddEducationToPersonalDetails < ActiveRecord::Migration[7.0]
  def change
    add_column :personal_details, :education, :text
  end
end
