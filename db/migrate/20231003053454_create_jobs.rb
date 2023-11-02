class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :company_name
      t.decimal :min_salary
      t.decimal :max_salary
      t.text :address
      t.string :city

      t.timestamps
    end
  end
end
