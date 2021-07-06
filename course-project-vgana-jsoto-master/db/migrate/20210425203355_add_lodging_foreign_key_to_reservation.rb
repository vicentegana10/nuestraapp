class AddLodgingForeignKeyToReservation < ActiveRecord::Migration[6.0]
  def change
    add_reference :reservations, :lodging, foreign_key: true
  end
end
