class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_prizes
  has_many :user_activities
  accepts_nested_attributes_for :user_prizes, :user_activities, allow_destroy: true, reject_if: :all_blank


  def update_points(points)
    self.points = self.points + points
    self.save
  end

end
