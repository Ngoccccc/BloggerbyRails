class CreateOrderDetails < ActiveRecord::Migration[8.0]
  def change
    create_table :orderdetails, id: false do |t|
      t.integer :orderNumber, null: false
      t.string :productCode, limit: 15, null: false
      t.integer :quantityOrdered, null: false
      t.decimal :priceEach, precision: 10, scale: 2, null: false
      t.integer :orderLineNumber, null: false
    end
    execute "ALTER TABLE orderdetails ADD PRIMARY KEY (orderNumber, productCode);"
  end
end