# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_06_15_152117) do
  create_table "customers", primary_key: "customerNumber", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "customerName", limit: 50, null: false
    t.string "contactLastName", limit: 50, null: false
    t.string "contactFirstName", limit: 50, null: false
    t.string "phone", limit: 50, null: false
    t.string "addressLine1", limit: 50, null: false
    t.string "addressLine2", limit: 50
    t.string "city", limit: 50, null: false
    t.string "state", limit: 50
    t.string "postalCode", limit: 15
    t.string "country", limit: 50, null: false
    t.integer "salesRepEmployeeNumber"
    t.decimal "creditLimit", precision: 10, scale: 2
  end

  create_table "employees", primary_key: "employeeNumber", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "lastName", limit: 50, null: false
    t.string "firstName", limit: 50, null: false
    t.string "extension", limit: 10, null: false
    t.string "email", limit: 100, null: false
    t.string "officeCode", limit: 10, null: false
    t.integer "reportsTo"
    t.string "jobTitle", limit: 50, null: false
  end

  create_table "offices", primary_key: "officeCode", id: { type: :string, limit: 10 }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "city", limit: 50, null: false
    t.string "phone", limit: 50, null: false
    t.string "addressLine1", limit: 50, null: false
    t.string "addressLine2", limit: 50
    t.string "state", limit: 50
    t.string "country", limit: 50, null: false
    t.string "postalCode", limit: 15, null: false
    t.string "territory", limit: 10, null: false
  end

  create_table "orderdetails", primary_key: ["orderNumber", "productCode"], charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "orderNumber", null: false
    t.string "productCode", limit: 15, null: false
    t.integer "quantityOrdered", null: false
    t.decimal "priceEach", precision: 10, scale: 2, null: false
    t.integer "orderLineNumber", null: false
  end

  create_table "orders", primary_key: "orderNumber", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "orderDate", null: false
    t.date "requiredDate", null: false
    t.date "shippedDate"
    t.string "status", limit: 15, null: false
    t.text "comments"
    t.integer "customerNumber", null: false
  end

  create_table "payments", primary_key: ["customerNumber", "checkNumber"], charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "customerNumber", null: false
    t.string "checkNumber", limit: 50, null: false
    t.date "paymentDate", null: false
    t.decimal "amount", precision: 10, scale: 2, null: false
  end

  create_table "productlines", primary_key: "productLine", id: { type: :string, limit: 50 }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "textDescription", limit: 4000
    t.text "htmlDescription"
    t.binary "image"
  end

  create_table "products", primary_key: "productCode", id: { type: :string, limit: 15 }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "productName", limit: 70, null: false
    t.string "productLine", limit: 50, null: false
    t.string "productScale", limit: 10, null: false
    t.string "productVendor", limit: 50, null: false
    t.text "productDescription", null: false
    t.integer "quantityInStock", null: false
    t.decimal "buyPrice", precision: 10, scale: 2, null: false
    t.decimal "MSRP", precision: 10, scale: 2, null: false
  end
end
