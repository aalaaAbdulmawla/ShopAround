class User < ActiveRecord::Base
  has_secure_password

  #Validations
  validates :name, presence: true, uniqueness: true
end
