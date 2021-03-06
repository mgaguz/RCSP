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

ActiveRecord::Schema.define(version: 20160717063212) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "humen", force: :cascade do |t|
    t.string   "nombre"
    t.string   "sexo"
    t.integer  "edad"
    t.string   "ocupacion"
    t.string   "estado_civil"
    t.text     "descripcion_del_paciente"
    t.text     "comentarios"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "user_id"
  end

  add_index "humen", ["user_id"], name: "index_humen_on_user_id", using: :btree

  create_table "patients", force: :cascade do |t|
    t.date     "fecha"
    t.string   "nombre"
    t.string   "sexo"
    t.integer  "edad"
    t.string   "ocupacion"
    t.string   "estado_civil"
    t.text     "descripcion_del_paciente"
    t.text     "anamnesis"
    t.time     "hora_de_inicio"
    t.text     "desarrollo_de_la_sesion"
    t.time     "hora_de_termino"
    t.text     "comentarios"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "human_id"
    t.integer  "user_id"
  end

  add_index "patients", ["human_id"], name: "index_patients_on_human_id", using: :btree
  add_index "patients", ["user_id"], name: "index_patients_on_user_id", using: :btree

  create_table "patients_tags", force: :cascade do |t|
    t.integer "patient_id"
    t.integer "tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string   "etiqueta"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "humen", "users"
  add_foreign_key "patients", "humen"
  add_foreign_key "patients", "users"
end
