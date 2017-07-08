class Meal < ActiveRecord::Base
  attr_accessor :product_ids
  
  belongs_to :user
  has_and_belongs_to_many :products
    
 def total_carbohydrates
    products.sum(:carbohydrates)
 end
 
 def total_proteins
    products.sum(:protein)
 end
 
 def total_fat
    products.sum(:fat)
 end
 
 def total_weight
    products.sum(:weight)
 end
 
 def total_calories
    products.sum(:calories)
 end
    
end
