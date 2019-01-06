class CommunityCommentsController < ApplicationController
  def create
    @comment = CommunityComment.new(comment_params)
    if @comment.save!
      flash[:success] = 'コメントを追加しました。'
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = 'コメントの追加に失敗しました。'
      redirect_back(fallback_location: root_path)
    end
  end
  
  private
  def comment_params
    params.require(:community_comment).permit(:content, :user_id, :community_topic_id)
  end
end
