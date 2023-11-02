class AddColumnToHollyday < ActiveRecord::Migration[7.0]
  def change
    add_column :hollydays, :allow, :boolean,  default: false
  end
end
