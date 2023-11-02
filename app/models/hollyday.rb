class Hollyday < ApplicationRecord
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :reason, presence: true
  validate :start_date_less_than_end_date
  validate :start_date_not_in_past
  validate :end_date_not_in_past

  def start_date_not_in_past
    if start_date && start_date < Date.today
      errors.add(:base, "Date cannot be in the past")
    end
  end

  def end_date_not_in_past
    if end_date && end_date < Date.today
      errors.add(:base, "Date cannot be in the past")
    end
  end


  def start_date_less_than_end_date
    if start_date.present? && end_date.present? && start_date > end_date
      errors.add(:base, "start date must be less than end date")
    end
  end


  def self.ransackable_attributes(auth_object = nil)
    %w[start_date end_date reason created_at updated_at] # Add other attributes you want to search on
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end


### name description account_id