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
    @account_color = "green" if @guest.account_status == 1
    @account_color = "blue" if @guest.account_status == 2
    @account_color = "yellow" if @guest.account_status == 3
    @account_color = "orange" if @guest.account_status == 4
    @account_color = "gray" if @guest.account_status == 5
    @account_color = "red" if @guest.account_status == 6
    @positive_feedbacks = Feedback.where(user_id: @guest.id, rating: '3').order("created_at desc")
    @negative_feedbacks = Feedback.where(user_id: @guest.id, rating: '1').order("created_at desc")
  end

end
