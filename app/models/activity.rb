class Activity < ApplicationRecord

  validates :title, :description, :image_path, :point_value, :activity_status, :strong_type, :wellness_type, :icon_path, presence: true
  mount_uploader :image_path, ImageUploader

end
