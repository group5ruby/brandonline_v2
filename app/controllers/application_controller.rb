class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: [:index]

  helper_method :avatar

  def avatar(url)    
      url || "http://i.imgur.com/P2u37kw.png"
  end
  
end
