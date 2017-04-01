class UsersController < ApplicationController
	def new

	end

	def show
		check_session
		@user = User.find(current_user.id)
		@banks = @user.bank_accounts
		if current_user.is_verified == true
			@is_verified = "Verified" 
		else
			@is_verified = "Unverified"
		end
		@account_status = AccountStatus.find(current_user.account_status)
		@icon = User.is_verified(current_user.identity_number)
		@feedbacks = Feedback.where(user_id: current_user.id)
		
		
		# @user.toggle :identity_number
		# @user.toggle :phone_number
		# @user.toggle :date_of_birth
		# @user.toggle :work_place
		# @user.toggle :career
		# @user.toggle :hometown
		# @user.save
	end

	def profile
		if(current_user != nil)
			if (params[:id] == current_user.id.to_s)
				return redirect_to user_path(params[:id])			
			end
		end 	
		@guest = User.find(params[:id])		
		if @guest.is_verified == true
			@is_verified = "Verified" 
		else
			@is_verified = "Unverified"
		end

		@account_status = AccountStatus.find(@guest.account_status)
		@icon = User.is_verified(@guest.identity_number)
	end

	def index
		if params[:search]
       @visits = User.search(params[:search]).order("created_at DESC")
    else
     	 @visits = User.all.order("created_at ASC")
    end  
	end

	def update
		@user = User.find(current_user.id)
		if params[:commit] == "update image"
			if @user.update(filepicker_url: params[:user][:filepicker_url])
				redirect_back(fallback_location: root_path)
			end
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
