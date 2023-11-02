class Comment < ApplicationRecord
  belongs_to :share
  validates :comment, presence: true

end
