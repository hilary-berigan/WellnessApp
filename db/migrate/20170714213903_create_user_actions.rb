class CreateUserActions < ActiveRecord::Migration[5.1]
  def change
    create_table :user_actions do |t|

      t.timestamps
    end
  end
end
