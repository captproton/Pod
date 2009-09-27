class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.string :last_name
      t.string :last_name_1
      t.string :last_name_2
      t.string :first_name
      t.string :address
      t.string :telephone
      t.string :parents
      t.string :email
      t.string :classroom
      t.integer :count
      t.string :corrected
      t.string :classroom_job
      t.timestamps
    end
  end
  
  def self.down
    drop_table :people
  end
end
