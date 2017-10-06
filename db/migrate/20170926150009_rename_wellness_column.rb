class RenameWellnessColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column("activities", "wellness_category", "wellness_type")
  end
end
