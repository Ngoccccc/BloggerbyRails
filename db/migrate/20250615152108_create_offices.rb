class CreateOffices < ActiveRecord::Migration[8.0]
  def change
    create_table :offices, id: false do |t|
      t.string :officeCode, primary_key: true, limit: 10
      t.string :city, limit: 50, null: false
      t.string :phone, limit: 50, null: false
      t.string :addressLine1, limit: 50, null: false
      t.string :addressLine2, limit: 50
      t.string :state, limit: 50
      t.string :country, limit: 50, null: false
      t.string :postalCode, limit: 15, null: false
      t.string :territory, limit: 10, null: false
    end
  end
end