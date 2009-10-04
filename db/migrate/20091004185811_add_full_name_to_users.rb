class AddFullNameToUsers < ActiveRecord::Migration
  def self.up
    add_column :profiles, :full_name, :string, :limit => 160
    add_column :profiles, :user_id, :integer
  end

  def self.down
    remove_column :profiles, :user_id
    remove_column :profiles, :full_name
  end
end
