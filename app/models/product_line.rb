class ProductLine < ApplicationRecord
  self.table_name = "productlines"
  self.primary_key = "productLine"

  has_many :products, foreign_key: "productLine"
end
