class User < ActiveRecord::Base
  acts_as_authentic
    acts_as_tagger
  has_many :documents
  has_many :articles
  has_many :memberships
  has_many :groups, :through => :memberships
  has_one :profile, :dependent=>:destroy
  accepts_nested_attributes_for :profile
  attr_accessible :profile_attributes # the format is the child_class followed by the "_attributes"
  
  validates_presence_of :invitation_id, :message => "is required"
  validates_uniqueness_of :invitation_id
  
  has_many :sent_invitations, :class_name => "Invitation", :foreign_key => "sender_id"
  belongs_to :invitation
  before_create :set_invitation_limit
  
  attr_accessible :login, :email, :password, :password_confirmation, :invitation_token

  def invitation_token
    invitation.token if invitation
  end
  
  def invitation_token=(token)
    self.invitation = Invitation.find_by_token(token)
  end
 
  def roles
    groups.find(:all, :conditions => "context = 'role'")
  end
  
  def has_role?(role)
    roles.map{ |g| g.name.downcase.to_sym }.include?(role)
  end
 

  private
  
  def set_invitation_limit
    self.invitation_limit = 5
  end
end
