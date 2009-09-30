class Article < ActiveRecord::Base
  belongs_to :user
  belongs_to :author, :class_name => "User", :foreign_key => "author_id"
  acts_as_taggable_on :tags, :spiels, :blogs, :helps, :classrooms
  
  attr_accessible :user_id, :title, :body, :comments_count
  
  ## search for tagged items in respective context. Uses acts_as_taggable_on.x
  def self.find_in_context(tag_list, context)
    self.tagged_with(tag_list, :on => context.to_sym)
  end
  
end
