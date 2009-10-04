class Profile < ActiveRecord::Base
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  attr_accessible :more_info_url, :bio, :location, :language, :time_zone
end
