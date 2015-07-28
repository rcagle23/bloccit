class SummaryController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @summary = Summary.new
  end
  
  def create
     @post = Post.find(params[:post_id])
     @summary = Summary.new(params.require(:summary).permit(:description))
     
    if @summary.save
      flash[:notice] = "Summary was saved."
      redirect_to [@post]
    else
      flash[:error] = "There was an error saving the summary. Please try again."
      render topic_post_summary_path
    end
  end

  def show
    @post = Post.find(params[:post_id])
    @summary = Summary.find(params[:id])
  end
end
