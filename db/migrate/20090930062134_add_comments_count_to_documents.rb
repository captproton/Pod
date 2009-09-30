class AddCommentsCountToDocuments < ActiveRecord::Migration
  def self.up
    add_column :documents, :comments_count, :integer, :default => 0
  end

  def self.down
    remove_column :documents, :comments_count
  end
end
