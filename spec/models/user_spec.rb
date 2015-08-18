require 'rails_helper'

describe User do
    include TestFactories
    
    describe ".top_rated" do
 
     before do
       @user1 = create(:user_with_post_and_comment)
       @user2 = create(:user_with_post_and_comment)
       @post = associated_post
       @comment = Comment.new(body: 'My comment is really great', post: @post, user: @other_user)
       2.times { @user2.comment.create(2) }
     end
 
     it "returns users ordered by comments + posts" do
       expect( User.top_rated ).to eq([@user1, @user2])
     end
 
     it "stores a `posts_count` on user" do
       users = User.top_rated
       expect( users.first.posts_count ).to eq(1)
     end
 
     it "stores a `comments_count` on user" do
       users = User.top_rated
       expect( users.first.comments_count ).to eq(2)
     end
   end
end