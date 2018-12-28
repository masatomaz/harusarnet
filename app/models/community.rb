class Community < ApplicationRecord
  belongs_to :user
  mount_uploader :image, CommunityImageUploader
  
  
  validates :name, presence: true, length: { maximum: 255 }
  validates :description, presence: true, length: { maximum: 5000 }
end
