class UsersController < ApplicationController
	def new
		# @bank_account = BankAccount.new
	end

	def show
		check_session
		@user = User.find(current_user.id)
		@bank_account = BankAccount.new
		@bank_accounts = @user.bank_accounts
		if @user.is_verified == true
			@is_verified = "Verified" 
			@verify_color = "green"
		else
			@is_verified = "Unverified"
			@verify_color = "red"
		end

		@account_color = "green" if @user.account_status == 1
		@account_color = "blue" if @user.account_status == 2
		@account_color = "yellow" if @user.account_status == 3
		@account_color = "orange" if @user.account_status == 4
		@account_color = "gray" if @user.account_status == 5
		@account_color = "red" if @user.account_status == 6
		

		@account_status = AccountStatus.find(current_user.account_status)
		@feedbacks = Feedback.where(user_id: current_user.id).order("created_at desc")
		@positive_feedbacks = Feedback.where(user_id: @user.id, rating: '3').order("created_at desc")
		@negative_feedbacks = Feedback.where(user_id: @user.id, rating: '1').order("created_at desc")
		
		# @user.toggle :identity_number
		# @user.toggle :phone_number
		# @user.toggle :date_of_birth
		# @user.toggle :work_place
		# @user.toggle :career
		# @user.toggle :is_verified
		# @user.save
	end

	def profile
		if(current_user != nil)
			if (params[:id] == current_user.id.to_s)
				return redirect_to user_path(params[:id])			
			end
		end 	
		@guest = User.find(params[:id])
		@bank_accounts = @guest.bank_accounts
		@account_status = AccountStatus.find(@guest.account_status)	
		@feedbacks = Feedback.where(user_id: @guest.id).order("created_at desc")
		@positive_feedbacks = Feedback.where(user_id: @guest.id, rating: '3').order("created_at desc")
		@negative_feedbacks = Feedback.where(user_id: @guest.id, rating: '1').order("created_at desc")
		@icon = User.is_verified(@guest.identity_number)
		if @guest.is_verified == true
			@is_verified = "Verified" 
			@verify_color = "green"
		else
			@is_verified = "Unverified"
			@verify_color = "orange"
		end

		@account_color = "green" if @guest.account_status == 1
		@account_color = "blue" if @guest.account_status == 2
		@account_color = "yellow" if @guest.account_status == 3
		@account_color = "orange" if @guest.account_status == 4
		@account_color = "gray" if @guest.account_status == 5
		@account_color = "red" if @guest.account_status == 6
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
				flash[:notice] = "Update Successful"
				redirect_back(fallback_location: root_path)
			else
				flash[:error] = "Update image failed"
				redirect_back(fallback_location: root_path)
			end
		end
		if params[:commit] == "update user"
			if @user.update(user_params)
				flash[:notice] = "Update Successful. Your verify request will be considered within 24 hours"
				redirect_back(fallback_location: root_path)

			else
				flash[:error] = "Update failed"
				redirect_back(fallback_location: root_path)
			end
		end
		if params[:commit] == "update info"
			if @user.update(user_contact_params)
				flash[:notice] = "Update Successful"
				redirect_back(fallback_location: root_path)
			else
				flash[:error] = "Update failed"
				redirect_back(fallback_location: root_path)
			end
		end
		if params[:commit] == "update description"
			if @user.update(description: params[:user][:description])
				flash[:notice] = "Update Successful"
				redirect_back(fallback_location: root_path)
			else
				flash[:error] = "Update failed"
				redirect_back(fallback_location: root_path)
			end
		end
	end 

		def feed
			check_session
			@follows = current_user.follows
			@user = current_user	
			@feedbacks = Feedback.where(user_id: current_user.id).order("created_at DESC")
			if current_user.is_verified == true
				@is_verified = "Verified" 
			else
				@is_verified = "Unverified"
			end			
			@account_status = AccountStatus.find(current_user.account_status)
			if @user.phone_number == "false" || @user.address = "false" 
				gon.person_info = "false"
			else
				gon.person_info = "true"
			end
			if @user.is_verified == true
			@is_verified = "Verified" 
			@verify_color = "green"
			else
			@is_verified = "Unverified"
			@verify_color = "red"
			end
			@account_status = AccountStatus.find(current_user.account_status)
			@account_color = "green" if @user.account_status == 1
			@account_color = "blue" if @user.account_status == 2
			@account_color = "yellow" if @user.account_status == 3
			@account_color = "orange" if @user.account_status == 4
			@account_color = "gray" if @user.account_status == 5
			@account_color = "red" if @user.account_status == 6

		end

		def destroy
			set_user
			@user.destroy
			respond_to do |format|
				format.html { redirect_to root_path, notice: 'User was successfully destroyed.' }
				format.json { head :no_content }
			end
		end



		private
		def check_session
			redirect_to root_path unless current_user

		end

		def set_user
			@user = User.find(params[:id])
		end

		def user_params
			params.require(:user).permit(:user_name, :identity_number, :date_of_birth, :sex, :hometown, :certificate_image)
		end

		def user_contact_params
			params.require(:user).permit(:phone_number, :address, :zalo, :career, :work_place, :business, :facebook_link)
		end


	end
