class AddUserForeignKeyToLodging < ActiveRecord::Migration[6.0]
  def change
    add_reference :lodgings, :user, foreign_key: true
  end
end
