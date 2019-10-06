class User < ActiveRecord::Base
  has_many :pokemon

  has_secure_password
  validates :username, :email, presence: true
end
