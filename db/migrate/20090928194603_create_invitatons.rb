class CreateInvitatons < ActiveRecord::Migration
  def self.up
    create_table :invitatons do |t|
      t.integer :sender_id
      t.string :recipeint_email
      t.string :token
      t.datetime :sent_at
      t.timestamps
    end
  end
  
  def self.down
    drop_table :invitatons
  end
end
