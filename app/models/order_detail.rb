class OrderDetail < ApplicationRecord
  self.table_name = "orderdetails"
  belongs_to :order, foreign_key: "orderNumber"
  belongs_to :product, foreign_key: "productCode"
end
