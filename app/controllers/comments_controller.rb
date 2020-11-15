class CommentsController < ApplicationController
  
  def index
    @commnet_topics = current_user.comment_topics
  end
  
  def new
    @comment = Comment.new
    @topic_id = (params[:topic_id])
  end
  
  def create
    @comment = current_user.comments.new(comment_params)
  
    if @comment.save
      redirect_to topics_path, success: 'コメントを投稿しました'
    else
      flash.now[:danger] = 'コメントに失敗しました'
      render :new
    end
  end
    
  private
  def comment_params
    params.require(:comment).permit(:content, :topic_id, :user_id)
  end
end
