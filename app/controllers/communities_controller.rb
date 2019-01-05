class CommunitiesController < ApplicationController
  def index
    @communities = Community.all.order('created_at DESC').page(params[:page]).per(5)
    @community = Community.new
    
  end
  
  def show
    
  end
  
  def new
    @community = Community.new
  end
  
  def create
    @community = current_user.communities.build(community_params)
    if @community.save!
      flash[:success] = 'コミュニティを作成しました。'
      redirect_to communities_path
    else
      @communities = current_user.communities.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'コミュニティの作成に失敗しました。'
      render 'communities/index'
    end
  end
  

  def edit
  end

  def destroy
  end
  
  
  private
  
  def community_params
    params.require(:community).permit(:name, :description, :image)
  end
  
  #def counts(community)
  #  @community_count = CommunityMember.where(community_id: community.id).count
  #end
end
