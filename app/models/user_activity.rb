class UserActivity < ApplicationRecord
    belongs_to :user
    has_one :activity
    validates :user_id, :activity_id, presence: true

end
