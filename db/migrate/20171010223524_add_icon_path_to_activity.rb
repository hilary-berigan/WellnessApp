class AddIconPathToActivity < ActiveRecord::Migration[5.1]
  def change
    add_column :activities, :icon_path, :string
  end
end
