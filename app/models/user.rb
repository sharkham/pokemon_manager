class User < ActiveRecord::Base
  has_many :pokemon

  has_secure_password
  validates :username, :email, presence: true
  validates :username, :email, uniqueness: { case_sensitive: false }
  validates :password, length: { in: 5..20, wrong_length: "Password must be between 5 and 20 characteres." }

  def slug
    self.username.gsub(" ", "-").downcase
  end

  def self.find_by_slug(slug)
    self.all.find{ |instance| instance.slug == slug }
  end

end
