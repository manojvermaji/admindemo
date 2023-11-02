class PostShare < ApplicationRecord
  belongs_to :user
  belongs_to :share
end
