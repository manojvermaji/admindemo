class CreateAvtars < ActiveRecord::Migration[7.0]
  def change
    create_table :avtars do |t|

      t.timestamps
    end
  end
end
