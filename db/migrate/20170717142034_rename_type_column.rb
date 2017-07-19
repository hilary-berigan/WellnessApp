class RenameTypeColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column("actions", "type", "strong_type")
  end
end
