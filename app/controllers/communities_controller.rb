class CommunitiesController < ApplicationController
  def index
    @communities = Community.all.page(params[:page])
  end
  
  def new
    @community = Community.new
  end
  
  def create
    @community = current_user.communities.build(community_params)
    if @community.save
      flash[:success] = 'コミュニティを作成しました。'
      redirect_to communities_path
    else
      @communities = current_user.communities.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'コミュニティの作成に失敗しました。'
      render 'toppages/index'
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
end
