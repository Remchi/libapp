class Book < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  
  validates :title, presence: true

end
