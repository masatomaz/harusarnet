class CommunityMembersController < ApplicationController
  def create
    @user = current_user
    @community = Community.find(params[:community_id])
    @user.join_community(@community)
    
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @community = Community.find(params[:community_id])
    current_user.leave_community(@community)
    redirect_back(fallback_location: root_path)
  end
  

  
end
