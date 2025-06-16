class Customer < ApplicationRecord
  self.primary_key = "customerNumber"

  belongs_to :employee, foreign_key: "salesRepEmployeeNumber", optional: true
  has_many :payments, foreign_key: "customerNumber"
  has_many :orders, foreign_key: "customerNumber"
end
