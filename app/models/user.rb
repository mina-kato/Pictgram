class User < ApplicationRecord
    validates :name, presence: true, uniqueness: true, 
                     length: {maximum: 15 }
    validates :email, presence: true

VALID_PASSWORD_REGEX = /\A[\w\-]+\z/
validates :password, presence: true, 
                     length: {minimum: 8, maximum: 32 },
                     format: {
                         with: VALID_PASSWORD_REGEX
                     },
                     allow_blank: true

VALID_EMAIL_REGEX =/\A[\w+\-.]+@[a-z\d\-.]+[a-z]+\z/i



    has_secure_password
end
