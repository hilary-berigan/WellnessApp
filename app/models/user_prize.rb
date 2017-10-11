class UserPrize < ApplicationRecord
    belongs_to :user
    belongs_to :prize
    validates :user_id, :prize_id, presence: true
end
