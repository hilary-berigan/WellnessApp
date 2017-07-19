class ChangeNameOfUserAction < ActiveRecord::Migration[5.1]
  def change
    rename_table :user_actions, :user_activities
  end
end
