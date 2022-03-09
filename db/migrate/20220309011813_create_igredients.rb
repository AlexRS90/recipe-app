class CreateIgredients < ActiveRecord::Migration[7.0]
  def change
    create_table :igredients do |t|
      t.references :recipes, null: false, foreign_key: true
      t.references :foods, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
