class HomeController < ApplicationController
	def welcome
    check_session
  end

  private
  def check_session
    return redirect_to feed_path if current_user
    return redirect_to control_path if current_admin
    redirect_to new_user_session_path
  end
end
