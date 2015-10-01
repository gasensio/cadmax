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

ActiveRecord::Schema.define(version: 20150930225814) do

  create_table "clientes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "clientes", ["name"], name: "index_clientes_on_name"

  create_table "foros", force: :cascade do |t|
    t.string   "titulo"
    t.text     "contenido"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "proyecto_id"
    t.integer  "user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "pedido"
    t.decimal  "horasof"
    t.decimal  "horasnf"
    t.decimal  "extra"
    t.decimal  "extraf"
    t.decimal  "nocturnas"
    t.decimal  "vacaciones"
    t.decimal  "bolsahg"
    t.decimal  "bolsahu"
    t.datetime "fecha"
    t.integer  "user_id"
    t.date     "alta"
    t.string   "proyecto"
    t.string   "cliente"
    t.time     "inicio"
    t.time     "fin"
    t.decimal  "viaje"
    t.decimal  "espera"
  end

  add_index "posts", ["alta"], name: "index_posts_on_alta"
  add_index "posts", ["proyecto"], name: "index_posts_on_proyecto"
  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "proyectos", force: :cascade do |t|
    t.string   "proyecto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "proyectos", ["proyecto"], name: "index_proyectos_on_proyecto"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.boolean  "admin"
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
