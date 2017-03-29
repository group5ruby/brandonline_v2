class HomeController < ApplicationController
	def index
    check_session
  end

  private
  def check_session
    redirect_to feed_path if current_user
  end
end
