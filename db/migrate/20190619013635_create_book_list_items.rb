class CreateBookListItems < ActiveRecord::Migration[5.2]
  def change
    create_table :book_list_items do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.boolean :for_trade

      t.timestamps
    end
  end
end
