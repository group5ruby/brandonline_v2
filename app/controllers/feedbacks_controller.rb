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
      redirect_to :back
    else
      flash[:error] = "Error!"
      redirect_to :back
    end
  end

  def show 
    @feedback = Feedback.find(params[:id])
  end

   def accepted
    @feedback = Feedback.find(params[:feedback_id])
    if @feedback.accept
      redirect_to root_path
      flash[:success] = "update success" 
    else
      flash[:error] = "Error #{@feedback.error.full_messages.to_sentence}"
      redirect_to root_path
    end    
  end

  def destroy
      @feedback = Feedback.find(params[:feedback_id])
      @feedback.destroy
      respond_to do |format|
        format.html { redirect_to root_path, notice: 'Feedback was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

  private

  def feedback_params
    params.require(:feedback).permit(:user_id, :guest_id, :content)
  end
end
