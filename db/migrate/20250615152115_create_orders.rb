class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders, id: false do |t|
      t.integer :orderNumber, primary_key: true
      t.date :orderDate, null: false
      t.date :requiredDate, null: false
      t.date :shippedDate
      t.string :status, limit: 15, null: false
      t.text :comments
      t.integer :customerNumber, null: false
    end
  end
end