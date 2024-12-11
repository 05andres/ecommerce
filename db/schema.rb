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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20241209221829) do

  create_table "admins", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "name"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true

  create_table "audits", :force => true do |t|
    t.integer  "admin_id"
    t.string   "action"
    t.text     "description"
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "audits", ["admin_id"], :name => "index_audits_on_admin_id"

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "creator_id"
  end

  create_table "customers", :force => true do |t|
    t.string   "email"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "customers", ["email"], :name => "index_customers_on_email", :unique => true

  create_table "images", :force => true do |t|
    t.integer  "product_id"
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "images", ["product_id"], :name => "index_images_on_product_id"

  create_table "products", :force => true do |t|
    t.integer  "category_id"
    t.string   "name"
    t.text     "description"
    t.decimal  "price",       :precision => 8, :scale => 2
    t.integer  "creator_id"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "products", ["category_id"], :name => "index_products_on_category_id"

  create_table "purchases", :force => true do |t|
    t.integer  "product_id"
    t.integer  "customer_id"
    t.decimal  "total_amount"
    t.integer  "quantity"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "purchases", ["customer_id"], :name => "index_purchases_on_customer_id"
  add_index "purchases", ["product_id"], :name => "index_purchases_on_product_id"

end
