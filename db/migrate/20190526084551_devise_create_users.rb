# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table "users", force: :cascade do |t|
      t.string   "email",                  default: "", null: false
      t.string   "encrypted_password",     default: "", null: false
      t.string   "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.integer  "sign_in_count",          default: 0,  null: false
      t.datetime "current_sign_in_at"
      t.datetime "last_sign_in_at"
      t.string   "current_sign_in_ip"
      t.string   "last_sign_in_ip"
      t.datetime "created_at",                          null: false
      t.datetime "updated_at",                          null: false
      t.string   "first_name"
      t.string   "last_name"
      t.string   "user_name"
      t.text     "about"
      t.integer  "mobile"
      t.date     "birthday"
      t.string   "avatar"
      t.string   "avatar_file_name"
      t.string   "avatar_content_type"
      t.integer  "avatar_file_size"
      t.datetime "avatar_updated_at"
  end
    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
  end
end
