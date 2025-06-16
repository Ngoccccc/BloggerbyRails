class Payment < ApplicationRecord
  self.table_name = "payments"
  belongs_to :customer, foreign_key: "customerNumber"
end
