# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100312044836) do

  create_table "comments", :force => true do |t|
    t.text     "content"
    t.string   "ip"
    t.integer  "good"
    t.integer  "bad"
    t.boolean  "flagged"
    t.integer  "texto_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "textos", :force => true do |t|
    t.text     "content"
    t.integer  "good"
    t.integer  "bad"
    t.integer  "status"
    t.integer  "texto_ref_id"
    t.string   "ip_address"
    t.integer  "validated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end