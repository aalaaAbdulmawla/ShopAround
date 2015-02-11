class User < ActiveRecord::Base
  has_secure_password

  #Validations
  validates :name, presence: true, uniqueness: true

  #Callbacks
  after_destroy :ensure_an_admin_remains

  private
  	def ensure_an_admin_remains
  		if User.count.zero?
  			raise "Can't delete last user"
  		end
  	end
end
