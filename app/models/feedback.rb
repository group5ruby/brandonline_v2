class Feedback < ApplicationRecord
  belongs_to :user
  belongs_to :guest, :class_name => "User"

  def accept    
      self.update(accepted_at:Time.now)   
  end
end
