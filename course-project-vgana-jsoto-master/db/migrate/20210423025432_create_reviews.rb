class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :rate
      t.text :description

      t.timestamps
    end
  end
end
