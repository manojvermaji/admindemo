class Share < ApplicationRecord
  has_one_attached :image
  # mount_uploader :image, ImageUploader

  has_one_attached :video
  has_one_attached :document
  has_one_attached :audio_data

  # belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes

  has_many :post_shares


end
