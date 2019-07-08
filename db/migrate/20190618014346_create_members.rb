class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :email, null: false
      t.string :password, null: false

      t.timestamps
    end
  end
end
