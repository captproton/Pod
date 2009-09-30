class AddAdminBooleanToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :admin, :boolean
    add_column :users, :editor, :boolean
  end

  def self.down
    remove_column :users, :editor
    remove_column :users, :admin
  end
end
