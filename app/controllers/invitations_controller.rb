class InvitationsController < ApplicationController
  def new
    @invitation = Invitation.new
  end
  
  def create
    @invitation = Invitation.new(params[:invitation])
    @invitation.sender = current_user
    if @invitation.save
      if current_user
        Mailer.deliver_invitation(@invitation, signup_url(@invitation.token))
        flash[:notice] = "Thank you, invitation sent."
        redirect_to account_url        
      else
        flash[:notice] = "Thank you.  We will get back to you within 24 hours."
        redirect_to root_url                
      end
    else
      render :action => 'new'
    end
  end
end
