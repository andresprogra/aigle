class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  enum profile: [:client, :admin]

  def name
    "#{first_name} #{last_name}"
  end
end
