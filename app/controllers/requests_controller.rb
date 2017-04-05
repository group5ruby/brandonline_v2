class RequestsController < ApplicationController
  def new
    @request = Request.new
    @guest = User.find(params[:guest_id])
  end

  def create
    @request = Request.new request_params
    if @request.save!
      flash[:success] = "Create request success"
    else
      flash[:error] = "Error"
    end
    redirect_to root_path
  end

  def show
    @request = Request.find(params[:id])

  end

  private
  def request_params
    params.require(:request).permit(:title, :user_id, :body, :image, :handle_at)
  end
end
