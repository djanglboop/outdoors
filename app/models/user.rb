class User < ApplicationRecord
    has_many :journals
    before_save { self.email = email.downcase }
    validates :username, presence: true, uniqueness: { case_sensetive: false }, length: { minimum: 3, maximum: 30 }
    VALID_EMAIL_REGEX = /\A[-\w.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: { case_sensetive: false },
    format: { with: VALID_EMAIL_REGEX }
    has_secure_password
end 