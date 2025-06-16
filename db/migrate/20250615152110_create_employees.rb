class CreateEmployees < ActiveRecord::Migration[8.0]
  def change
    create_table :employees, id: false do |t|
      t.integer :employeeNumber, primary_key: true
      t.string :lastName, limit: 50, null: false
      t.string :firstName, limit: 50, null: false
      t.string :extension, limit: 10, null: false
      t.string :email, limit: 100, null: false
      t.string :officeCode, limit: 10, null: false
      t.integer :reportsTo
      t.string :jobTitle, limit: 50, null: false
    end
  end
end