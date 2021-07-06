class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :location
      t.string :bio
      t.integer :role

      t.timestamps
    end
  end
end