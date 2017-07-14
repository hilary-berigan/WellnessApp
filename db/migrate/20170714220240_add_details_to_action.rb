class AddDetailsToAction < ActiveRecord::Migration[5.1]
  def change
    add_column :actions, :title, :string
    add_column :actions, :description, :string
    add_column :actions, :image_path, :string 
    add_column :actions, :point_value, :integer 
    add_column :actions, :activity_status, :string 
    add_column :actions, :type, :string 
  end
end
