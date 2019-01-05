class CommunityTopic < ApplicationRecord
  mount_uploader :image, CommunityImageUploader
  belongs_to :user
  belongs_to :community
  
  validates :title, presence: true, length: { maximum: 255}
  validates :content, length: { maximum: 5000}
  

end
