class AddCompletionDateToUserActivity < ActiveRecord::Migration[5.1]
  def change
    add_column :user_activities, :completion_date, :date
  end
end
