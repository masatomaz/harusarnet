class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: :index
  protect_from_forgery with: :exception
  before_action :configure_permitted_params, if: :devise_controller?
  
  def configure_permitted_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :prefecture])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :gender, :birthday, :profile, :profile_picture, :prefecture])
  end
  
  
  private
  
  def topic_counts(community)
    #@count_topics = community.topics.count
  end
  
  def post_counts(topic)
    #@count_posts = topic.community_posts.count
  end
end
