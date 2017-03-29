class UsersController < ApplicationController
	def show
		@user = User.find(current_user.id)
		check_session
		if current_user.is_verified == true
			@is_verified = "Verified" 
		else
			@is_verified = "Unverified"
		end
		@account_status = AccountStatus.find(current_user.account_status)
		@icon = User.is_verified(current_user.identity_number)
	end

	def update
		@user = User.find(current_user.id)
		if @user.update(filepicker_url: params[:user][:filepicker_url])
			redirect_to root_path
		end
	end 

	def feed
		check_session
		if current_user.is_verified == true
			@is_verified = "Verified" 
		else
			@is_verified = "Unverified"
		end
		@account_status = AccountStatus.find(current_user.account_status)
	end

	private
	def check_session
		redirect_to root_path unless current_user
	end
end
