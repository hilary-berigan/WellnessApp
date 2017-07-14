class AddDetailsToPrize < ActiveRecord::Migration[5.1]
  def change
    add_column :prizes, :title, :string
    add_column :prizes, :description, :string
    add_column :prizes, :image_path, :string 
    add_column :prizes, :point_value, :integer 
    add_column :prizes, :activity_status, :string 
    add_column :prizes, :quantity, :integer 
  end
end
