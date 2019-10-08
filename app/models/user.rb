class User < ActiveRecord::Base
  has_many :pokemon

  has_secure_password
  validates :username, :email, presence: true

  def slug
    self.username.gsub(" ", "-").downcase
  end

  def self.find_by_slug(slug)
    self.all.find{ |instance| instance.slug == slug }
  end

end
