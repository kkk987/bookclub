class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :street, null: false
      t.string :suburb, null: false
      t.string :state, null: false
      t.string :country, null: false
      t.string :postcode, null: false
      t.references :member, foreign_key: true

      t.timestamps
    end
  end
end
