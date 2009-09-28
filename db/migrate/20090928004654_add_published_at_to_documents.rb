class AddPublishedAtToDocuments < ActiveRecord::Migration
  def self.up
    add_column :documents, :published_on, :datetime, :default => Time.now 
  end

  def self.down
    remove_column :documents, :published_on
  end
end
