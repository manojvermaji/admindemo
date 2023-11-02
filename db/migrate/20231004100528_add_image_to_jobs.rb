class AddImageToJobs < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :image, :string
  end
end
