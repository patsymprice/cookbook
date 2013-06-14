class Author < ActiveRecord::Base
  has_secure_password
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation

  validates :email, uniqueness => true
end
