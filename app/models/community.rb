class Community < ApplicationRecord
  mount_uploader :image, CommunityImageUploader
  
  validates :name, presence: true, length: { maximum: 255 }
  validates :description, presence: true, length: { maximum: 5000 }
  
  belongs_to :user
  has_many :community_members
  has_many :users, through: :community_members
  has_many :community_topics
  
  
  
end
