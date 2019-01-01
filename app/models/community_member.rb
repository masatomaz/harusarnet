class CommunityMember < ApplicationRecord
  belongs_to :user
  belongs_to :community
  
  def self.counting
    self.where(community_id: :community_id).count
  end
end
