# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160801001743) do

  create_table "batches", force: :cascade do |t|
    t.string   "detail"
    t.date     "expiration_date"
    t.date     "entry_date"
    t.integer  "product_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "remaining_units"
    t.integer  "total_units"
  end

  add_index "batches", ["product_id"], name: "index_batches_on_product_id"

  create_table "clients", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "dni"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "clients", ["user_id"], name: "index_clients_on_user_id"

  create_table "items", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "amount",     null: false
    t.integer  "price",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payment_forms", force: :cascade do |t|
    t.string   "nombre"
    t.boolean  "permiteDarCambio"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.integer  "minimum"
    t.integer  "amount"
    t.integer  "batch_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "supplier_id"
    t.float    "price"
  end

  add_index "products", ["batch_id"], name: "index_products_on_batch_id"
  add_index "products", ["supplier_id"], name: "index_products_on_supplier_id"

  create_table "sale_details", force: :cascade do |t|
    t.integer  "fila"
    t.float    "precio"
    t.integer  "cantidad"
    t.integer  "product_id"
    t.integer  "sale_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sale_details", ["product_id"], name: "index_sale_details_on_product_id"
  add_index "sale_details", ["sale_id"], name: "index_sale_details_on_sale_id"

  create_table "sales", force: :cascade do |t|
    t.datetime "fecha"
    t.integer  "nro"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "client_id"
    t.integer  "user_id"
  end

  add_index "sales", ["client_id"], name: "index_sales_on_client_id"
  add_index "sales", ["user_id"], name: "index_sales_on_user_id"

  create_table "suppliers", force: :cascade do |t|
    t.string   "name"
    t.string   "product_request_url"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "role"
  end

  create_table "vfps", force: :cascade do |t|
    t.float    "cantidad",        default: 0.0
    t.integer  "sale_id"
    t.integer  "payment_form_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "vfps", ["payment_form_id"], name: "index_vfps_on_payment_form_id"
  add_index "vfps", ["sale_id"], name: "index_vfps_on_sale_id"

end
