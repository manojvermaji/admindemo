class CreateShares < ActiveRecord::Migration[7.0]
  def change
    create_table :shares do |t|
      t.text :description

      t.timestamps
    end
  end
end
