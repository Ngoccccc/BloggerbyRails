class Office < ApplicationRecord
  self.primary_key = "officeCode"

  has_many :employees, foreign_key: "officeCode"
end
