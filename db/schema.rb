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

ActiveRecord::Schema.define(version: 20150110094007) do

  create_table "bundles", primary_key: "ID_BUNDLE_KEY", force: true do |t|
    t.string   "BundleName"
    t.string   "BundleDescription"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hackers", primary_key: "ID_USER_ACCOUNT_KEY", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "username"
    t.string   "password"
    t.string   "email"
    t.integer  "rating"
    t.datetime "lastlogintime"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "problem_setters", primary_key: "ID_PROBLEM_SETTER_KEY", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "username"
    t.string   "password"
    t.integer  "totalproblemsuploaded"
    t.datetime "lastlogintime"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "problems", primary_key: "ID_PROBLEM_KEY", force: true do |t|
    t.string   "ProblemName"
    t.text     "ProblemDescription"
    t.date     "ProblemTimeUploaded"
    t.integer  "ID_PROBLEM_SETTER_FKEY"
    t.integer  "ID_BUNDLE_FKEY"
    t.integer  "Points"
    t.integer  "TotalHackerSolved"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "submissions", primary_key: "ID_SUBMISSION_KEY", force: true do |t|
    t.integer  "ID_PROBLEM_FKEY"
    t.integer  "ID_HACKER_FKEY"
    t.string   "SubmissionOutputURL"
    t.string   "Language"
    t.time     "SubmissionTime"
    t.string   "Verdict"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "test_cases", primary_key: "ID_TEST_CASES_KEY", force: true do |t|
    t.integer  "ID_PROBLEM_FKEY"
    t.string   "TestCaseInputURL"
    t.string   "TestCaseOutputURL"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
