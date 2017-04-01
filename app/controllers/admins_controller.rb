class AdminsController < ApplicationController
  before_action :authenticate_admin!
  def control
    @users = User.where(seen: nil)
    @users = @users.order("created_at DESC")
    @feedback = Feedback.where(accepted_at: nil)
    @feedback = @feedback.order("created_at DESC")
  end

  def eprofile
     @guest = User.find(params[:id])   
  end

end
