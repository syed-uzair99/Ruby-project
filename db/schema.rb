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

ActiveRecord::Schema[7.0].define(version: 2022_05_06_063037) do
  create_table "item_categories", force: :cascade do |t|
    t.integer "CategoryNo"
    t.integer "CategoryID"
    t.string "CategoryName"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_lists", force: :cascade do |t|
    t.integer "ItemNo"
    t.integer "itemCategory_id"
    t.string "CategoryName"
    t.integer "ItemID"
    t.string "ItemName"
    t.float "ItemPrice"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sale_details", force: :cascade do |t|
    t.integer "SaleNo"
    t.integer "CategoryID"
    t.string "CategoryName"
    t.integer "ItemId"
    t.string "ItemName"
    t.string "TotalQuantity"
    t.decimal "ItemPrice"
    t.decimal "TotalCost"
    t.datetime "DateofSale"
    t.string "CustomerName"
    t.integer "OrderID"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stock_details", force: :cascade do |t|
    t.integer "StockNo"
    t.integer "CategoryID"
    t.string "CategoryName"
    t.integer "ItemId"
    t.string "ItemName"
    t.integer "TotalStock"
    t.integer "SoldStock"
    t.integer "RemainingStock"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_roles", force: :cascade do |t|
    t.string "roleName"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "item_lists", "item_categories", column: "itemCategory_id"
  add_foreign_key "sale_details", "item_categories", column: "CategoryID"
  add_foreign_key "sale_details", "item_lists", column: "ItemId"
  add_foreign_key "stock_details", "item_categories", column: "CategoryID"
  add_foreign_key "stock_details", "item_lists", column: "ItemId"
end
