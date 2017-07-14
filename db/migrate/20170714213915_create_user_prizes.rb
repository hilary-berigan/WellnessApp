class CreateUserPrizes < ActiveRecord::Migration[5.1]
  def change
    create_table :user_prizes do |t|

      t.timestamps
    end
  end
end
