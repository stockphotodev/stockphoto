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

ActiveRecord::Schema.define(version: 2019_05_03_032931) do

  create_table "admin_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "download_limits", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "limit_of_image", default: 0, null: false
    t.integer "limit_of_illustration", default: 0, null: false
    t.integer "limit_of_movie", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_download_limits_on_user_id"
  end

  create_table "illustration_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "illustration_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_illustration_categories_on_category_id"
    t.index ["illustration_id"], name: "index_illustration_categories_on_illustration_id"
  end

  create_table "illustration_illustration_tags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "illustration_id"
    t.bigint "illustration_tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["illustration_id", "illustration_tag_id"], name: "illustration_illustration_tags_index", unique: true
    t.index ["illustration_id"], name: "index_illustration_illustration_tags_on_illustration_id"
    t.index ["illustration_tag_id"], name: "index_illustration_illustration_tags_on_illustration_tag_id"
  end

  create_table "illustration_tags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "illustrations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "illustration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "image_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "image_image_tags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "image_id"
    t.bigint "image_tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["image_id"], name: "index_image_image_tags_on_image_id"
    t.index ["image_tag_id"], name: "index_image_image_tags_on_image_tag_id"
  end

  create_table "image_tags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "image_category_id"
    t.index ["image_category_id"], name: "index_images_on_image_category_id"
  end

  create_table "movie_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "movie_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_movie_categories_on_category_id"
    t.index ["movie_id"], name: "index_movie_categories_on_movie_id"
  end

  create_table "movie_movie_tags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "movie_id"
    t.bigint "movie_tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_movie_movie_tags_on_movie_id"
    t.index ["movie_tag_id"], name: "index_movie_movie_tags_on_movie_tag_id"
  end

  create_table "movie_tags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "movie"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "period", null: false
    t.integer "limit_of_image", null: false
    t.integer "limit_of_illustration", null: false
    t.integer "limit_of_movie", null: false
    t.integer "price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin_flg"
    t.bigint "plan_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["plan_id"], name: "index_users_on_plan_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "illustration_categories", "categories"
  add_foreign_key "illustration_categories", "illustrations"
  add_foreign_key "illustration_illustration_tags", "illustration_tags"
  add_foreign_key "illustration_illustration_tags", "illustrations"
  add_foreign_key "image_image_tags", "image_tags"
  add_foreign_key "image_image_tags", "images"
  add_foreign_key "movie_categories", "categories"
  add_foreign_key "movie_categories", "movies"
  add_foreign_key "movie_movie_tags", "movie_tags"
  add_foreign_key "movie_movie_tags", "movies"
end
