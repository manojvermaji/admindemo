class PersonalDetail < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_one_attached :video
  # validates :phone_number, length: { is: 10 }
  validates_length_of :phone_number, is: 10, allow_blank: true



  # validates :phone_number, allow_blank: true, format: { with: /\A\d{10}\z/, message: "must be exactly 10 digits or blank" }


  def self.ransackable_attributes(auth_object = nil)
    %w[phone_number email gender dob marital_status blood_group image video hobbies work_experiences education created_at updated_at image] # Add other attributes you want to search on
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

end
