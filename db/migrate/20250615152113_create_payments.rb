class CreatePayments < ActiveRecord::Migration[8.0]
  def change
    create_table :payments, id: false do |t|
      t.integer :customerNumber, null: false
      t.string :checkNumber, limit: 50, null: false
      t.date :paymentDate, null: false
      t.decimal :amount, precision: 10, scale: 2, null: false
    end
    execute "ALTER TABLE payments ADD PRIMARY KEY (customerNumber, checkNumber);"
  end
end