class BankAccount < ApplicationRecord
  belongs_to :user
  validates_presence_of :name, :user_id, :account_number
  validates_uniqueness_of :account_number

  # def self.banks(user)
  # 	return BankAccount.new if BankAccount.where(user_id: user.id).count == 0
  # 	BankAccount.where(user_id: user.id).first
  # end
end
