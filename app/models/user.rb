class User < ApplicationRecord
  has_secure_password  # Подключает bcrypt

  validates :name, presence: true
  validates :user_email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  has_many :calculations
end
