class AddImageToShare < ActiveRecord::Migration[7.0]
  def change
    add_column :shares, :image, :string

  end
end
