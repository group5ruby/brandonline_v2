class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate, :except=> [:welcome]
  #before_action :check_admin_logged_in!, :except => [:index]
  helper_method :avatar
  helper_method :is_verify
  helper_method :show_value
  helper_method :account_status
  helper_method :account_verify

  def avatar(url)    
      url || "http://i.imgur.com/P2u37kw.png"
  end
  
  def is_verify(value)
      if value == true
        return "checkmark icon verified"
      else
        return "help circle icon"
      end
  end

  def account_verify(user)
    if user.is_verified == true
      "Verified" 
    else
      "Unverified"
    end   
  end

  def show_value(value)
      return "Not available" if value == nil
      return "Not available" if value == "false"
      value || "Not available"
  end

  def account_status(status)
    return AccountStatus.find(status)
  end
  protected

  def authenticate
    unless current_user || current_admin
      authenticate_user!
    end
  end


end
