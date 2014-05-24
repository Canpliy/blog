class User < ActiveRecord::Base
  has_secure_password
  before_save { self.email.downcase! }

  validates :name, presence: true
  validates :email, presence: true
  validates :signature, presence: true
end
