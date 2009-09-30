class FrontdoorController < ApplicationController
  before_filter :require_no_user, :only => [:index]
  
  def index
  end

end
