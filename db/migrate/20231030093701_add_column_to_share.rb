class AddColumnToShare < ActiveRecord::Migration[7.0]
  def change
    add_column :shares, :video, :string
  end
end
