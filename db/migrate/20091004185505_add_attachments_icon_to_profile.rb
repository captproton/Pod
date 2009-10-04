class AddAttachmentsIconToProfile < ActiveRecord::Migration
  def self.up
    add_column :profiles, :icon_file_name, :string
    add_column :profiles, :icon_content_type, :string
    add_column :profiles, :icon_file_size, :integer
  end

  def self.down
    remove_column :profiles, :icon_file_name
    remove_column :profiles, :icon_content_type
    remove_column :profiles, :icon_file_size
  end
end
