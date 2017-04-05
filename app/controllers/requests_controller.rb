class RequestsController < ApplicationController
  def new
    @request = Request.new
    @guest = User.find(params[:guest_id])
  end

  def create
    @request = Request.new request_params
    @guest = User.find(params[:request][:guest_id])
    if @request.save!
      flash[:success] = "Thank you! Your report has been sent."
      redirect_to profile_path(id: @guest.id)
    else
      flash[:error] = "Error"
      render 'new'
    end
   
  end

  def show
    @request = Request.find(params[:id])

  end

  private
  def request_params
    params.require(:request).permit(:title, :user_id, :body, :handle_at, :guest_id)
  end
end
