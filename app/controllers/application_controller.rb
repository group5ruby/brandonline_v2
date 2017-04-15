class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate, :except=> [:welcome, :profile,:index]
  #before_action :check_admin_logged_in!, :except => [:index]
  helper_method :avatar
  helper_method :is_verify
  helper_method :show_value
  helper_method :account_status
  helper_method :account_verify
  helper_method :type_icon

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
      "color: green"
    else
     "color: red"
    end   
  end

  def show_value(value)
      if value == nil || value =="false" || value==""
        "Not available"
      else
        value
      end
  end

  def type_icon(value)
    case value
    when "1"
      "circular inverted blue facebook f icon"
    when "2"
      "circular inverted orange amazon icon"
    when "3"
      "circular inverted blue linkedin icon"
    else
      "circular inverted red location arrow icon"
    end
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
