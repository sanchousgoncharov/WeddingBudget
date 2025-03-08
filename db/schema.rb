# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_03_08_181027) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "alcos", force: :cascade do |t|
    t.integer "calc_id"
    t.integer "order", comment: "Порядок вывода"
    t.string "title"
    t.float "litres_for_one", comment: "Литры алкоголя на одного человека"
  end

  create_table "budgets", force: :cascade do |t|
    t.integer "calc_id"
    t.integer "order", comment: "Порядок вывода"
    t.string "title"
    t.integer "planned_sum", comment: "Планируемая сумма"
    t.integer "actual_sum", comment: "Фактическая сумма"
    t.integer "prepay_sum", comment: "Сумма предоплаты"
    t.integer "remain_sum", comment: "Остаток суммы"
  end

  create_table "calculations", force: :cascade do |t|
    t.string "title"
    t.integer "user_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "contractors", force: :cascade do |t|
    t.integer "calc_id"
    t.integer "order", comment: "Порядок вывода"
    t.string "category", comment: "Подрядчик"
    t.string "responsible", comment: "Ответственный (имя)"
    t.string "description"
    t.boolean "status", comment: "Статус"
    t.string "name"
    t.string "phone"
    t.string "email"
  end

  create_table "controls", force: :cascade do |t|
    t.integer "calc_id"
    t.integer "order", comment: "Порядок вывода"
    t.string "title"
    t.integer "actual_sum", comment: "Фактическая сумма"
    t.integer "prepay_sum", comment: "Сумма предоплаты"
    t.integer "remain_sum", comment: "Остаток суммы"
    t.string "date"
    t.string "place"
  end

  create_table "guests", force: :cascade do |t|
    t.integer "calc_id"
    t.integer "order", comment: "Порядок вывода"
    t.string "name"
    t.string "phone"
    t.boolean "invited", comment: "Приглашен?"
    t.boolean "arrive", comment: "Придет?"
    t.boolean "zags", comment: "Приглашен в загс?"
    t.boolean "party", comment: "Приглашен на мальчишник или девичник?"
    t.string "guest", comment: "С чей стороны гость?"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.string "user_email"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  add_foreign_key "alcos", "calculations", column: "calc_id"
  add_foreign_key "budgets", "calculations", column: "calc_id"
  add_foreign_key "calculations", "users"
  add_foreign_key "contractors", "calculations", column: "calc_id"
  add_foreign_key "controls", "calculations", column: "calc_id"
  add_foreign_key "guests", "calculations", column: "calc_id"
end
