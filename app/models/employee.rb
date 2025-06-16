class Employee < ApplicationRecord
  self.primary_key = "employeeNumber"

  belongs_to :office, foreign_key: "officeCode"
  belongs_to :manager, class_name: "Employee", foreign_key: "reportsTo", optional: true
  has_many :subordinates, class_name: "Employee", foreign_key: "reportsTo"
  has_many :customers, foreign_key: "salesRepEmployeeNumber"
end
