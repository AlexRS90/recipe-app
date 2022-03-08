class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.integer :user_id
      t.string :name
      t.string :measurement_unit
      t.decimal :price

      t.timestamps
    end
    add_index :foods, :user_id
  end
end
