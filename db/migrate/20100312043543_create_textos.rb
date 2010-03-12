class CreateTextos < ActiveRecord::Migration
  def self.up
    create_table :textos do |t|
      t.text :content
      t.integer :good
      t.integer :bad
      t.integer :status
      t.integer :texto_ref_id
      t.string :ip_address
      t.integer :validated_by

      t.timestamps
    end
  end

  def self.down
    drop_table :textos
  end
end
