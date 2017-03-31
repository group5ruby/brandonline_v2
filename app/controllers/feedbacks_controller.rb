class FeedbacksController < ApplicationController
  def new
   @guest = User.find_by_id(params[:user_id])
   @feedback = Feedback.new   
  end

  def create
    @guest = User.find_by_id(params[:user_id])
    @feedback = @guest.feedbacks.build feedback_params  
    if @feedback.save
      flash[:sucess] = "Success!"
    else
      flash[:error] = "Erors!"
    end
    redirect_to root_path
  end

  private

  def feedback_params
    params.require(:feedback).permit(:user_id, :guest_id, :content)
  end
end
