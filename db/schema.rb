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

ActiveRecord::Schema.define(:version => 20120115035359) do

  create_table "accounts", :force => true do |t|
    t.integer "user_id"
    t.decimal "balance",                  :precision => 10, :scale => 0
    t.decimal "available_funds",          :precision => 10, :scale => 0
    t.decimal "withdrawn_funds",          :precision => 10, :scale => 0
    t.decimal "funds_awaiting_clearance", :precision => 10, :scale => 0
    t.decimal "revenue_purchases",        :precision => 10, :scale => 0
    t.decimal "incoming_payments",        :precision => 10, :scale => 0
    t.decimal "money_spent",              :precision => 10, :scale => 0
  end

  create_table "active_admin_comments", :force => true do |t|
    t.integer  "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "bids", :force => true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.float    "price"
    t.text     "why"
    t.datetime "offer_expires"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "accept_current_price"
    t.boolean  "accepted",             :default => false
  end

  create_table "categories", :force => true do |t|
    t.string  "name",       :null => false
    t.integer "project_id"
  end

  create_table "community_projects", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.text     "tags"
    t.float    "price"
    t.datetime "due_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feedbacks", :force => true do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.text     "feedback"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "keywords", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "message_recipients", :force => true do |t|
    t.integer  "message_id",    :null => false
    t.integer  "receiver_id",   :null => false
    t.string   "receiver_type", :null => false
    t.string   "kind",          :null => false
    t.integer  "position"
    t.string   "state",         :null => false
    t.datetime "hidden_at"
  end

  add_index "message_recipients", ["message_id", "kind", "position"], :name => "index_message_recipients_on_message_id_and_kind_and_position", :unique => true

  create_table "messages", :force => true do |t|
    t.integer  "sender_id",   :null => false
    t.string   "sender_type", :null => false
    t.text     "subject"
    t.text     "body"
    t.string   "state",       :null => false
    t.datetime "hidden_at"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "problems", :force => true do |t|
    t.text     "detail"
    t.integer  "project_id"
    t.string   "name"
    t.string   "contact"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",     :default => "open"
  end

  create_table "profiles", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "location"
    t.string   "about"
    t.string   "paypal"
    t.string   "facebook"
    t.string   "twitter"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.boolean  "image_approved",       :default => false
    t.string   "zipcode"
  end

  add_index "profiles", ["zipcode"], :name => "index_profiles_on_zipcode"

  create_table "project_alerts", :force => true do |t|
    t.string   "message"
    t.datetime "occurred"
    t.integer  "project_id"
    t.string   "alert_type"
    t.integer  "bid_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.text     "tags"
    t.float    "price"
    t.datetime "due_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bid_count",   :default => 0
    t.string   "city"
    t.string   "state"
    t.boolean  "approved",    :default => false
    t.string   "category"
    t.string   "sm_state"
    t.string   "zipcode"
  end

  add_index "projects", ["category"], :name => "index_projects_on_category"
  add_index "projects", ["sm_state"], :name => "index_projects_on_sm_state"
  add_index "projects", ["zipcode"], :name => "index_projects_on_zipcode"

  create_table "resumes", :force => true do |t|
    t.string   "title"
    t.text     "activities"
    t.text     "experience"
    t.text     "education"
    t.text     "sample_work"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skills", :force => true do |t|
    t.integer  "user_id"
    t.string   "skill"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transactions", :force => true do |t|
    t.integer  "account_id"
    t.float    "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "paypal_transaction_id", :null => false
    t.string   "sm_state"
    t.string   "tx_type"
  end

  add_index "transactions", ["paypal_transaction_id"], :name => "index_transactions_on_paypal_transaction_id"

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "",    :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",                     :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.boolean  "is_admin",                            :default => false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["is_admin"], :name => "index_users_on_is_admin"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

  create_table "works", :force => true do |t|
    t.integer  "user_id"
    t.string   "work_file_name"
    t.string   "work_content_type"
    t.integer  "work_file_size"
    t.datetime "work_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "image_approved",    :default => false
  end

  create_table "zip_codes", :force => true do |t|
    t.integer "zipcode", :null => false
    t.string  "city"
    t.string  "state"
    t.float   "lat"
    t.float   "lng"
  end

  add_index "zip_codes", ["zipcode"], :name => "index_zip_codes_on_zipcode", :unique => true

end
