class Article < ActiveRecord::Base
  belongs_to :user
  belongs_to :author, :class_name => "User", :foreign_key => "author_id"
  acts_as_taggable_on :tags, :spiels, :blogs, :helps, :classrooms
  
  attr_accessible :user_id, :title, :body, :comments_count
end
