class ChangeActiontoActivity < ActiveRecord::Migration[5.1]
  def change
    rename_table :actions, :activities
  end
end
