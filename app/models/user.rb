class User < ActiveRecord::Base
  has_many :games
  VALID_EMAIL_REGEX = /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/

  before_save { email.downcase! }

  validates :name, presence: true,
                   length: { minimum: 1, maximum: 50 }
  validates :email, presence: true,
                    length: { maximum: 250 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password
end
