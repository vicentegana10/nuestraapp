class CreateJoinTableLodgingsServices < ActiveRecord::Migration[6.0]
  def change
    create_join_table :lodgings, :services do |t|
      # t.index [:lodging_id, :service_id]
      # t.index [:service_id, :lodging_id]
    end
  end
end
