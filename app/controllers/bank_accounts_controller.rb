class BankAccountsController < ApplicationController
	def index
	end


	def new
		@bank = BankAccount.new
	end

	def create
		@bank = BankAccount.new bank_params
		@bank[:user_id] = current_user.id
		if @bank.save 
			flash[:success] = "successful"
		else
			
		end
	end

	def destroy
		
		BankAccount.find(params[:id]).destroy
		redirect_to :back
		
	end

	private
	def bank_params
		params.require(:bank_account).permit(:name, :user_id, :account_number)
	end
end
