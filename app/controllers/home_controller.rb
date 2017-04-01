class HomeController < ApplicationController
	def welcome
    check_session
  end

  private
  def check_session
    redirect_to feed_path if current_user
    redirect_to control_path if current_admin
  end
end
