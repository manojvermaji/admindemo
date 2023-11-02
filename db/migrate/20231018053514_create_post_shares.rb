class CreatePostShares < ActiveRecord::Migration[7.0]
  def change
    create_table :post_shares do |t|
      t.references :user, null: false, foreign_key: true
      t.references :share, null: false, foreign_key: true

      t.timestamps
    end
  end
end
