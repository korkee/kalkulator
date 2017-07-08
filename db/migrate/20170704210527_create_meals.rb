class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.integer :user_id, null: false
      t.string  :name
      t.text    :description
      t.string  :sort
      
      
      
      t.timestamps null: false
    end
  end
end
