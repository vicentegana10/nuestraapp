class AddUserForeignKeyToStay < ActiveRecord::Migration[6.0]
  def change
    add_reference :stays, :user, foreign_key: true

  end
end
