class Book < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  
  validates :title, presence: true

  belongs_to :reader

  def owned_by?(owner) 
    if owner && owner.id == reader.id
      true
    else
      false
    end
  end

end
