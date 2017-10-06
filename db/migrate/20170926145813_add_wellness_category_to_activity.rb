class AddWellnessCategoryToActivity < ActiveRecord::Migration[5.1]
  def change
    add_column :activities, :wellness_category, :string
  end
end
