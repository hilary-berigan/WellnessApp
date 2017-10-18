class Prize < ApplicationRecord
  validates :title, :description, :image_path, :point_value, :activity_status, :quantity, presence: :true
  mount_uploader :image_path, ImageUploader
end
