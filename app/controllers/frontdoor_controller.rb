class FrontdoorController < ApplicationController
  
  def index
    @invitation = Invitation.new
    @user_session = UserSession.new
    
    render(:layout => false) 
  end

end
