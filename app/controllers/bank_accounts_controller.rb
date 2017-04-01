class BankAccountsController < ApplicationController
	
	def new
		@bank_account = BankAccount.new
	end

	def create
		@bank_account = BankAccount.new bank_account_params
		@bank_account[:user_id] = current_user.id
		respond_to do |format|
      if @bank_account.save
       format.js
     else
      raise
     end
   end
 end

 def destroy

  BankAccount.find(params[:id]).destroy
  redirect_to :back

end

private
def bank_account_params
  params.require(:bank_account).permit(:name, :user_id, :account_number, :bank_name)
end
end
