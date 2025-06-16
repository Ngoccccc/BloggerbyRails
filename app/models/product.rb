class Product < ApplicationRecord
  self.primary_key = "productCode"

  belongs_to :product_line, foreign_key: "productLine"
  has_many :order_details, foreign_key: "productCode"
end
