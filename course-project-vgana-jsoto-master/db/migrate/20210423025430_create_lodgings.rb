class CreateLodgings < ActiveRecord::Migration[6.0]
  def change
    create_table :lodgings do |t|
      t.string :title
      t.integer :fee
      t.string :location
      t.string :policy
      t.text :description

      t.timestamps
    end
  end
end
