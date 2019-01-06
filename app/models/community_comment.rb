class CommunityComment < ApplicationRecord
  belongs_to :user
  belongs_to :community_topic
end
