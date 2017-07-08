class CreateJoinTableProductMeal < ActiveRecord::Migration
  def change
    create_join_table :products, :meals do |t|
      t.index [:product_id, :meal_id]
      t.index [:meal_id, :product_id]
    end
  end
end
