class User < ApplicationRecord
  VALID_EMAIL_REGEX =/\A[\w+\-.]+@[a-z\d\-.]+[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A[\w\-]+\z/

  validates :name, presence: true, uniqueness: true, length: {maximum: 15 }
  validates :email, presence: true
  validates :password, presence: true, 
                     length: {minimum: 8, maximum: 32 },
                     format: {
                         with: VALID_PASSWORD_REGEX
                     },
                     allow_blank: true
                     
  has_secure_password
  
  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: :topic
  has_many :comments
end
