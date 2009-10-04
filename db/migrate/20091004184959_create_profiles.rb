class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.string :more_info_url
      t.string :bio, :limit => 160
      t.string :location
      t.string :language
      t.string :time_zone
      t.timestamps
    end
  end
  
  def self.down
    drop_table :profiles
  end
end
