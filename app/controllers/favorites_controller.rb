class FavoritesController < ApplicationController
  def create
     @post = Post.find(params[:post_id])
     @favorite = current_user.favorites.build(post: @post)
     
     authorize @favorite
 
     if @favorite.save
       flash[:notice] = "This post has been favorited successfully."
       redirect_to [@post.topic, @post]
     else
       flash[:error] = "The post wasn't favorited, please try again."
       render :new
     end
  end
  
   def destroy
     @post = Post.find(params[:post_id])
     @favorite = current_user.favorites.find(params[:id])
     
     authorize @favorite
     
     if @favorite.destroy
       flash[:notice] = "This post has been unfavorited successfully."
       redirect_to [@post.topic, @post]
     else
       flash[:notice] = "The post wasn't unfavorited, please try again."
       redirect_to [@post.topic, @post]
     end
   end
end
