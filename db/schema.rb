# frozen_string_literal: true

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

ActiveRecord::Schema[7.0].define(version: 20_221_010_102_406) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'pgcrypto'
  enable_extension 'plpgsql'

  create_table 'answers', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'user_id', null: false
    t.uuid 'question_id', null: false
    t.string 'answer'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['question_id'], name: 'index_answers_on_question_id'
    t.index ['user_id'], name: 'index_answers_on_user_id'
  end

  create_table 'assignments', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'user_id', null: false
    t.uuid 'role_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['role_id'], name: 'index_assignments_on_role_id'
    t.index ['user_id'], name: 'index_assignments_on_user_id'
  end

  create_table 'comment_replies', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'user_id', null: false
    t.uuid 'comment_id', null: false
    t.string 'reply'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['comment_id'], name: 'index_comment_replies_on_comment_id'
    t.index ['user_id'], name: 'index_comment_replies_on_user_id'
  end

  create_table 'comments', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'title'
    t.uuid 'user_id'
    t.uuid 'package_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['package_id'], name: 'index_comments_on_package_id'
    t.index ['user_id'], name: 'index_comments_on_user_id'
  end

  create_table 'networks', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.uuid 'user_id', null: false
    t.index ['user_id'], name: 'index_networks_on_user_id'
  end

  create_table 'packages', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.integer 'package_type'
    t.string 'name'
    t.integer 'price'
    t.string 'detail'
    t.string 'description'
    t.integer 'validity'
    t.string 'subscription_code'
    t.string 'area'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.uuid 'network_id', null: false
    t.uuid 'user_id', null: false
    t.index ['network_id'], name: 'index_packages_on_network_id'
    t.index ['user_id'], name: 'index_packages_on_user_id'
  end

  create_table 'questions', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'title'
    t.uuid 'user_id'
    t.uuid 'package_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['package_id'], name: 'index_questions_on_package_id'
    t.index ['user_id'], name: 'index_questions_on_user_id'
  end

  create_table 'roles', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'email'
    t.string 'name'
    t.string 'password_digest'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
  end

  add_foreign_key 'answers', 'questions'
  add_foreign_key 'answers', 'users'
  add_foreign_key 'assignments', 'roles'
  add_foreign_key 'assignments', 'users'
  add_foreign_key 'comment_replies', 'comments'
  add_foreign_key 'comment_replies', 'users'
  add_foreign_key 'comments', 'packages'
  add_foreign_key 'comments', 'users'
  add_foreign_key 'networks', 'users'
  add_foreign_key 'packages', 'networks'
  add_foreign_key 'packages', 'users'
  add_foreign_key 'questions', 'packages'
  add_foreign_key 'questions', 'users'
end
