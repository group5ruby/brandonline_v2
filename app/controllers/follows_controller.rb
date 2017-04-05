class FollowsController < ApplicationController
	def show
		
	end

	def new
		@follow = Follow.new
	end

	def create
		@follow = Follow.new
		@follow[:user_id] = params[:followed_id]
		@follow[:follower_id] = current_user.id
		if @follow.save
			flash[:success] = "Followed!!!"
			redirect_to :back
		end
	end

	private
	def follow_params
		params.require(:follow).permit(:user_id, :follower_id)
	end
end
