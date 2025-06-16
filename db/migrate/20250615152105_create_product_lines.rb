class CreateProductLines < ActiveRecord::Migration[8.0]
  def change
    create_table :productlines, id: false do |t|
      t.string :productLine, primary_key: true, limit: 50
      t.string :textDescription, limit: 4000
      t.text :htmlDescription
      t.binary :image
    end
  end
end