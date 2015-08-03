class CommentsController < ApplicationController
  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end
  
  def create
     @topic = Topic.find(params[:topic_id])
     @post = Post.find(params[:post_id])
     @comment = current_user.comments.build(comment_params)
     @comment.post = @post
    
    if @comment.save
      flash[:notice] = "Comment was saved."
      redirect_to [@post]
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      redirect_to [@post]
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:body, :user_id, :post_id)
  end
end