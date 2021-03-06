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

ActiveRecord::Schema.define(version: 20190105163513) do

  create_table "communities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "description", limit: 65535
    t.string   "image"
    t.integer  "user_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["user_id"], name: "index_communities_on_user_id", using: :btree
  end

  create_table "community_comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "content",            limit: 65535
    t.integer  "user_id"
    t.integer  "community_topic_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["community_topic_id"], name: "index_community_comments_on_community_topic_id", using: :btree
    t.index ["user_id"], name: "index_community_comments_on_user_id", using: :btree
  end

  create_table "community_members", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "community_id"
    t.boolean  "facilitator",  default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["community_id"], name: "index_community_members_on_community_id", using: :btree
    t.index ["user_id", "community_id"], name: "index_community_members_on_user_id_and_community_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_community_members_on_user_id", using: :btree
  end

  create_table "community_topics", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "community_id"
    t.string   "title"
    t.text     "content",      limit: 65535
    t.string   "image"
    t.integer  "view_count"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["community_id"], name: "index_community_topics_on_community_id", using: :btree
    t.index ["user_id"], name: "index_community_topics_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                                default: "", null: false
    t.string   "encrypted_password",                   default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "token"
    t.integer  "gender",                 limit: 2
    t.date     "birthday"
    t.text     "profile",                limit: 65535
    t.string   "profile_picture"
    t.boolean  "admin"
    t.integer  "prefecture"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "communities", "users"
  add_foreign_key "community_comments", "community_topics"
  add_foreign_key "community_comments", "users"
  add_foreign_key "community_members", "communities"
  add_foreign_key "community_members", "users"
  add_foreign_key "community_topics", "communities"
  add_foreign_key "community_topics", "users"
end
