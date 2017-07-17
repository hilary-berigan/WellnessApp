class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_prizes
  has_many :user_actions
  accepts_nested_attributes_for :user_prizes, :user_actions 
  

end
