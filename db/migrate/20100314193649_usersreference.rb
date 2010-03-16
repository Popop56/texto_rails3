class Usersreference < ActiveRecord::Migration
  def self.up
    change_table :textos do |t|
      t.references :users
    end
    change_table :comments do |t|
      t.references :users
    end
  end

  def self.down
  end
end
