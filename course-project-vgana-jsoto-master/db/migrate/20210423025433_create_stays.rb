class CreateStays < ActiveRecord::Migration[6.0]
  def change
    create_table :stays do |t|
      t.date :check_in
      t.date :check_out

      t.timestamps
    end
  end
end
