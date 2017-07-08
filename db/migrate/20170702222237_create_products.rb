class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string  :name
      t.integer :calories
      t.integer :carbohydrates
      t.integer :protein
      t.integer :fat
      t.integer :weight

      t.timestamps null: false
    end
  end
end
