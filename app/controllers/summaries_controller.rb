class SummariesController < ApplicationController
  def show
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = Summary.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = Summary.new
  end
  
  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = Summary.new(params.require(:summary).permit(:description))
    
    if @summary.save
      flash[:notice] = "Summary saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an issue saving the Summary. Please try again."
      render :new
    end
  end
end
