class AddHobbiesToPersonalDetails < ActiveRecord::Migration[7.0]
  def change
    add_column :personal_details, :hobbies, :string

  end
end
