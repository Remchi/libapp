class Reader < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true
  validates :email, email: true
  validates :email, uniqueness: true
end
