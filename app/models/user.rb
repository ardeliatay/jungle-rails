class User < ActiveRecord::Base
  has_many :orders
  has_secure_password

  validates :email, uniqueness: true


end
