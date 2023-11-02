class User < ApplicationRecord
has_many :posts
has_many :likes
has_many :post_shares

# has_many :shares
# has_many :shared_posts, through: :post_shares, source: :share
# has_many :post_shares, class_name: 'PostShare', foreign_key: 'user_id'
# has_many :shared_shares, through: :post_shares, source: :share

end
