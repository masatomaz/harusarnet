class CommunityTopicsController < ApplicationController
  def index
    @community = Community.find_by(id: params[:community_id])
    @topics = @community.community_topics.all.order('created_at DESC').page(params[:page]).per(5)
    @topic = @community.community_topics.new
    topic_counts(@community)
  end

  def show
    @community = Community.find_by(id: params[:community_id])
    @topic = CommunityTopic.find(params[:id])
    @comments = @topic.community_comments.all.order('created_at DESC').page(params[:page]).per(5)
    @comment = CommunityComment.new
    
    @topic.increment(:view_count)
    @topic.save
  end



  def create
    @community = Community.find_or_initialize_by(id: params[:community_id])
    @topic = @community.community_topics.build(topic_params)
    @topic.user_id = current_user.id
    @topic.view_count = 0
    if @topic.save!
      flash[:success] = 'トピックを作成しました。'
      redirect_back(fallback_location: root_path)
    else
      @topics = CommunityTopic.all.page(params[:page]).per(5)
      flash.now[:danger] = 'トピックの作成に失敗しました。'
      render 'community_community_topics/index'
    end
  end

  def destroy
  end
  
  
  private
  
  def topic_params
    params.require(:community_topic).permit(:title, :content, :image, :view_count)
  end
end
