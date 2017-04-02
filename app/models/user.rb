class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
  :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]
  has_many :feedbacks
  has_many :received_feedbacks, class_name: "Feedback", foreign_key: "user_id"
  has_many :bank_accounts, dependent: :destroy
  # validates_uniqueness_of :identity_number


  def self.from_omniauth(auth)
  	where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  		user.email = auth.info.email
      puts auth.info.name
      user.password = Devise.friendly_token[0,20]
      user.user_name = auth.info.name
      user.filepicker_url = auth.info.image
    # assuming the user model has a name
    #user.image = auth.info.image # assuming the user model has an image
    # If you are using confirmable and the provider(s) you use validate emails, 
    # uncomment the line below to skip the confirmation emails.
    # user.skip_confirmation!
  end
end

def self.new_with_session(params, session)
  super.tap do |user|
    if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
      user.email = data["email"] if user.email.blank?
    end
  end
end

def self.has_seen
end

def self.search(search)
  where("user_name ILIKE ?","%#{search}%").or(where("email ILIKE ?","%#{search}%"))
end
def self.is_verified(b)
  if b  == true
    return "checkmark icon verified"
  else
    return "help circle icon"
  end
end

def self.to_date
  return "" if user.date_of_birth == nil
  user.date_of_birth
end


end
