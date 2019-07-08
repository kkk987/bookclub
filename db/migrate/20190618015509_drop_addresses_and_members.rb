class DropAddressesAndMembers < ActiveRecord::Migration[5.2]
  def change
    drop_table :addresses
    drop_table :members
  end
end
