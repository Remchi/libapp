class Book < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  
  validates :title, presence: true

  belongs_to :reader

  mount_uploader :cover, CoverUploader

  def owned_by?(owner) 
    if owner && owner.id == reader.id
      true
    else
      false
    end
  end

end
