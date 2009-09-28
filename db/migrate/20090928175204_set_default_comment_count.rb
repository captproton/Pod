class SetDefaultCommentCount < ActiveRecord::Migration
  def self.up
    change_column_default :articles, :comments_count, 0
  end

  def self.down
    change_column_default :articles, :comments_count, ""
  end
end
