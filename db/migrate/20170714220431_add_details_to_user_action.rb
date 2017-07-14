class AddDetailsToUserAction < ActiveRecord::Migration[5.1]
  def change
    add_column :user_actions, :user_id, :integer
    add_column :user_actions, :action_id, :integer
    add_column :user_actions, :image_path, :string 
    add_column :user_actions, :verified, :boolean 
    add_column :user_actions, :points_earned, :string 
    add_column :user_actions, :completion_day, :integer 
    add_column :user_actions, :completion_month, :integer 
    add_column :user_actions, :completion_year, :integer 
  end
end
