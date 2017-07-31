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

ActiveRecord::Schema.define(version: 20170731124252) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cursos", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lixodones", force: :cascade do |t|
    t.integer  "residente_id"
    t.date     "data"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "lixotodos", force: :cascade do |t|
    t.integer  "residente_id"
    t.date     "data"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "periodos", force: :cascade do |t|
    t.date     "start"
    t.date     "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quartos", force: :cascade do |t|
    t.integer  "numero"
    t.string   "piso"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "residentes", force: :cascade do |t|
    t.string   "matricula"
    t.string   "nome"
    t.integer  "curso_id"
    t.integer  "quarto_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "full_name"
    t.string   "email"
    t.string   "password"
    t.integer  "quarto_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quarto_id"], name: "index_users_on_quarto_id", using: :btree
  end

  add_foreign_key "users", "quartos"
end
