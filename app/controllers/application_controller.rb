class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: [:index]

  helper_method :avatar
  helper_method :is_verify
  helper_method :show_value

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

  def show_value(value)
      return "Not available" if value == nil
      value.value || "Not available"
  end  
end
