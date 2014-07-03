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

ActiveRecord::Schema.define(:version => 20140619102525) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

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
    t.string   "code",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "fetchers", :force => true do |t|
    t.integer  "provider_id",                                      :null => false
    t.integer  "status_id",                                        :null => false
    t.integer  "transport_id",                                     :null => false
    t.integer  "retain_id",                                        :null => false
    t.string   "username"
    t.string   "passkey"
    t.string   "basename"
    t.string   "directory"
    t.string   "seperator"
    t.string   "file_filter"
    t.string   "directory_filter",  :limit => 1024
    t.string   "format"
    t.string   "set"
    t.string   "set_limit"
    t.string   "charset"
    t.integer  "recursive"
    t.boolean  "remote_delete"
    t.boolean  "passive"
    t.integer  "timeout"
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
    t.integer  "deliver_period_id"
    t.integer  "supply_id",                         :default => 0, :null => false
    t.string   "realm"
    t.integer  "port"
    t.string   "encryption"
    t.integer  "sleep_interval"
    t.string   "provider_format"
  end

  add_index "fetchers", ["deliver_period_id"], :name => "index_fetchers_on_deliver_period_id"
  add_index "fetchers", ["provider_id"], :name => "index_fetchers_on_provider_id"
  add_index "fetchers", ["retain_id"], :name => "index_fetchers_on_retain_id"
  add_index "fetchers", ["status_id"], :name => "index_fetchers_on_status_id"
  add_index "fetchers", ["supply_id"], :name => "index_fetchers_on_supply_id"
  add_index "fetchers", ["transport_id"], :name => "index_fetchers_on_transport_id"

  create_table "fulltexts", :force => true do |t|
    t.string   "code",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ipaddresses", :force => true do |t|
    t.integer  "provider_id", :null => false
    t.string   "address",     :null => false
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
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "providers", :force => true do |t|
    t.string   "code",             :limit => 30,                :null => false
    t.string   "description",                                   :null => false
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
    t.integer  "provider_type_id",               :default => 1, :null => false
  end

  add_index "providers", ["code"], :name => "index_providers_on_code", :unique => true
  add_index "providers", ["provider_type_id"], :name => "index_providers_on_provider_type_id"

  create_table "retains", :force => true do |t|
    t.string   "code",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "statuses", :force => true do |t|
    t.string   "code",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "supplies", :force => true do |t|
    t.string   "code",       :limit => 10, :null => false
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "transports", :force => true do |t|
    t.string   "code",                                    :null => false
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.boolean  "uses_basename",         :default => true, :null => false
    t.boolean  "uses_charset",          :default => true, :null => false
    t.boolean  "uses_directory",        :default => true, :null => false
    t.boolean  "uses_directory_filter", :default => true, :null => false
    t.boolean  "uses_file_filter",      :default => true, :null => false
    t.boolean  "uses_format",           :default => true, :null => false
    t.boolean  "uses_passive",          :default => true, :null => false
    t.boolean  "uses_passkey",          :default => true, :null => false
    t.boolean  "uses_recursive",        :default => true, :null => false
    t.boolean  "uses_remote_delete",    :default => true, :null => false
    t.boolean  "uses_seperator",        :default => true, :null => false
    t.boolean  "uses_set",              :default => true, :null => false
    t.boolean  "uses_set_limit",        :default => true, :null => false
    t.boolean  "uses_timeout",          :default => true, :null => false
    t.boolean  "uses_username",         :default => true, :null => false
    t.boolean  "uses_encryption",       :default => true, :null => false
    t.boolean  "uses_port",             :default => true, :null => false
    t.boolean  "uses_realm",            :default => true, :null => false
    t.boolean  "uses_sleep_interval",   :default => true, :null => false
    t.boolean  "uses_provider_format",  :default => true, :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
