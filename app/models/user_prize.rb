class UserPrize < ApplicationRecord
    belongs_to :user
    has_one :prize
    validates :user_id, :prize_id, presence: true
end
