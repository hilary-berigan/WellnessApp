class CreateActions < ActiveRecord::Migration[5.1]
  def change
    create_table :actions do |t|

      t.timestamps
    end
  end
end
