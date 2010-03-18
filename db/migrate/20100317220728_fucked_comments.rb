class FuckedComments < ActiveRecord::Migration
  def self.up
    remove_column :comments, :users_id
  end

  def self.down
  end
end
