class Order < ApplicationRecord
  self.primary_key = "orderNumber"

  belongs_to :customer, foreign_key: "customerNumber"
  has_many :order_details, foreign_key: "orderNumber"
end
