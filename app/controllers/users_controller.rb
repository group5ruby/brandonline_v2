class UsersController < ApplicationController
	def show
		check_session
		if current_user.is_verified == true
			@is_verified = "Verified" 
		else
			@is_verified = "Unverified"
		end
		@account_status = AccountStatus.find(current_user.account_status)
		@icon = User.is_verified(current_user.identity_number)
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
