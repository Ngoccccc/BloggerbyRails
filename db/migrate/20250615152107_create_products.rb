class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products, id: false do |t|
      t.string :productCode, primary_key: true, limit: 15
      t.string :productName, limit: 70, null: false
      t.string :productLine, limit: 50, null: false
      t.string :productScale, limit: 10, null: false
      t.string :productVendor, limit: 50, null: false
      t.text :productDescription, null: false
      t.integer :quantityInStock, null: false
      t.decimal :buyPrice, precision: 10, scale: 2, null: false
      t.decimal :MSRP, precision: 10, scale: 2, null: false
    end
  end
end