class Reader < ActiveRecord::Base
  has_secure_password

  has_many :books
  validates :email, presence: true
  validates :email, email: true
  validates :email, uniqueness: true
end
