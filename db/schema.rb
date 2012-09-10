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

ActiveRecord::Schema.define(:version => 20120910083018) do

  create_table "consumers", :force => true do |t|
    t.string   "code",        :null => false
    t.text     "description", :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "consumers_packages", :force => true do |t|
    t.integer  "consumer_id"
    t.integer  "package_id"
    t.integer  "fulltext_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "consumers_packages", ["consumer_id"], :name => "index_consumers_packages_on_consumer_id"
  add_index "consumers_packages", ["fulltext_id"], :name => "index_consumers_packages_on_fulltext_id"
  add_index "consumers_packages", ["package_id"], :name => "index_consumers_packages_on_package_id"

  create_table "consumers_providers", :force => true do |t|
    t.integer  "consumer_id", :null => false
    t.integer  "provider_id", :null => false
    t.integer  "fulltext_id", :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "consumers_providers", ["consumer_id"], :name => "index_consumers_providers_on_consumer_id"
  add_index "consumers_providers", ["fulltext_id"], :name => "index_consumers_providers_on_fulltext_id"
  add_index "consumers_providers", ["provider_id"], :name => "index_consumers_providers_on_provider_id"

  create_table "deliver_periods", :force => true do |t|
    t.string   "code",        :null => false
    t.string   "description", :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "fetchers", :force => true do |t|
    t.integer  "provider_id",      :null => false
    t.integer  "status_id",        :null => false
    t.integer  "transport_id",     :null => false
    t.integer  "retain_id",        :null => false
    t.string   "username"
    t.string   "password"
    t.string   "basename"
    t.string   "directory"
    t.string   "seperator"
    t.string   "file_filter"
    t.string   "directory_filter"
    t.string   "format"
    t.string   "set"
    t.string   "set_limit"
    t.string   "charset"
    t.integer  "recursive"
    t.boolean  "remote_delete"
    t.boolean  "passive"
    t.integer  "timeout"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "fetchers", ["provider_id"], :name => "index_fetchers_on_provider_id"
  add_index "fetchers", ["retain_id"], :name => "index_fetchers_on_retain_id"
  add_index "fetchers", ["status_id"], :name => "index_fetchers_on_status_id"
  add_index "fetchers", ["transport_id"], :name => "index_fetchers_on_transport_id"

  create_table "fulltexts", :force => true do |t|
    t.string   "code",        :null => false
    t.text     "description", :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "ipaddresses", :force => true do |t|
    t.integer  "provider_id", :null => false
    t.string   "ipaddress",   :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "ipaddresses", ["provider_id"], :name => "index_ipaddresses_on_provider_id"

  create_table "packages", :force => true do |t|
    t.integer  "provider_id", :null => false
    t.string   "code",        :null => false
    t.text     "description", :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "packages", ["provider_id"], :name => "index_packages_on_provider_id"

  create_table "provider_types", :force => true do |t|
    t.string   "code"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "providers", :force => true do |t|
    t.string   "code"
    t.string   "description"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "provider_type_id", :default => 1, :null => false
  end

  add_index "providers", ["code"], :name => "index_providers_on_short_name", :unique => true

  create_table "providers_supplies", :id => false, :force => true do |t|
    t.integer "provider_id", :null => false
    t.integer "supply_id",   :null => false
  end

  create_table "retains", :force => true do |t|
    t.string   "code",        :null => false
    t.string   "description", :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "statuses", :force => true do |t|
    t.string   "code",        :null => false
    t.string   "description", :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "supplies", :force => true do |t|
    t.string   "code",        :limit => 10
    t.text     "description"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "transports", :force => true do |t|
    t.string   "code",        :null => false
    t.string   "description", :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
