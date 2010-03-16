class TextoCustom < ActiveRecord::Migration
  def self.up
    remove_column :textos, :texto_ref_id
  end

  def self.down
  end
end
