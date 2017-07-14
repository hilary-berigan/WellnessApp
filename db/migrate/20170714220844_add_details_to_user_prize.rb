class AddDetailsToUserPrize < ActiveRecord::Migration[5.1]
  def change
    add_column :user_prizes, :user_id, :integer
    add_column :user_prizes, :prize_id, :integer
    add_column :user_prizes, :verified, :boolean 
    add_column :user_prizes, :points_earned, :string 
    add_column :user_prizes, :redeemed_day, :integer 
    add_column :user_prizes, :redeemed_month, :integer 
    add_column :user_prizes, :redeemed_year, :integer 
  end
end
