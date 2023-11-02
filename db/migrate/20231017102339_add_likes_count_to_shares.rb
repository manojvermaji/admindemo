class AddLikesCountToShares < ActiveRecord::Migration[7.0]
  def change
    add_column :shares, :likes_count, :integer
  end
end
