class SummaryController < ApplicationController
  def show
    @post = Post.find(params[:post_id])
    @summary = Summary.find(params[:id])
  end

  def new
    @post = Post.find(params[:post_id])
    @summary = Summary.new
  end
  
  def create
    @post = Post.find(params[:post_id])
    @summary = Summary.new(params.require(:summary).permit(:description))
    
    if @summary.save
      flash[:notice] = "Summary saved."
      redirect_to @post
    else
      flash[:error] = "There was an issue saving the Summary. Please try again."
      render :new
    end
  end
end
