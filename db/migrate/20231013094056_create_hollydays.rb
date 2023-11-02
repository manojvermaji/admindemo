class CreateHollydays < ActiveRecord::Migration[7.0]
  def change
    create_table :hollydays do |t|
      t.date :start_date
      t.date :end_date
      t.text :reason

      t.timestamps
    end
  end
end
