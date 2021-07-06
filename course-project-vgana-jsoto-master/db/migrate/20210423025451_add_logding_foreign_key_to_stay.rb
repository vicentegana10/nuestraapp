class AddLogdingForeignKeyToStay < ActiveRecord::Migration[6.0]
  def change

    add_reference :stays, :lodging, foreign_key: true
  end
end
