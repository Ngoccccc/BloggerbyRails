class CreateCustomers < ActiveRecord::Migration[8.0]
  def change
    create_table :customers, id: false do |t|
      t.integer :customerNumber, primary_key: true
      t.string :customerName, limit: 50, null: false
      t.string :contactLastName, limit: 50, null: false
      t.string :contactFirstName, limit: 50, null: false
      t.string :phone, limit: 50, null: false
      t.string :addressLine1, limit: 50, null: false
      t.string :addressLine2, limit: 50
      t.string :city, limit: 50, null: false
      t.string :state, limit: 50
      t.string :postalCode, limit: 15
      t.string :country, limit: 50, null: false
      t.integer :salesRepEmployeeNumber
      t.decimal :creditLimit, precision: 10, scale: 2
    end
  end
end