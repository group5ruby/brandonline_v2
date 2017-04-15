class ConnectsController < ApplicationController
	def new
		@user = current_user
		@connect = Connect.new
		
	end

	def create
		@connect = Connect.new connect_params
		if @connect.save
      flash[:sucess] = "Success!"
      redirect_to root_path
    else
      flash[:error] = "Error!"
      redirect_to root_path
    end

	end

	def destroy
	end

	private

	def connect_params
		params.require(:connect).permit(:title, :image_url, :type, :link, :type_web, :user_id)
	end

end
