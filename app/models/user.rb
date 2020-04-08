class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  
  has_secure_password

  validates :password, length: { minimum: 6 }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

end