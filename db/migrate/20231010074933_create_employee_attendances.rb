class CreateEmployeeAttendances < ActiveRecord::Migration[7.0]
  def change
    create_table :employee_attendances do |t|
      t.date :date
      t.string :attendence
      t.string :mode_of_work
      t.integer :working_hours
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
