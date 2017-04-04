class AdminsController < ApplicationController
  before_action :authenticate_admin!
  def control
    @users = User.where(seen: nil)
    @users = @users.order("created_at DESC")
    @feedback = Feedback.where(accepted_at: nil)
    @feedback = @feedback.order("created_at DESC")
    @requests = Request.where(handle_at: nil)
    @requests = @requests.order("created_at DESC")
  end

  def eprofile
     @guest = User.find(params[:id])  
     @bank_accounts = @guest.bank_accounts
     @account_status = AccountStatus.find(@guest.account_status)  
     @feedbacks = Feedback.where(user_id: @guest.id).order("created_at desc")
      @icon = User.is_verified(@guest.identity_number) 
  end

end
