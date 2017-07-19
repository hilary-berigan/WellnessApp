class ChangeTableNameAction < ActiveRecord::Migration[5.1]
  def change
    rename_column("user_activities", "action_id", "activity_id")

  end
end
