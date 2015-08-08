require 'rails_helper'

describe 'Vote' do
  describe "validations" do
    
    describe "value validation" do
      before do
        @user = User.create!(email: 'usernamehere@example.com', password: 'helloworld')
        @topic = Topic.create!(name: 'Topics Title')
        @post = Post.create!(title: 'post title', body: 'post body needs to be at least 20 characters', topic: @topic, user: @user)
        
      end
      it "only allows -1 or 1 as values" do
        # your expectations here
        vote = @post.votes.create(value: -1)
        expect(vote.value).to eq(-1)
        expect(vote.valid?).to eq(true)
      end
      
       it "only allows -1 or 1 as values" do
        # your expectations here
        vote = @post.votes.create(value: 1)
        expect(vote.value).to eq(1)
        expect(vote.valid?).to eq(true)

      end
      
      it "only should reject values other than -1 or 1" do
        # your expectations here
        vote = @post.votes.create(value: 4)
        expect(vote.valid?).to eq(false)
      end
    end
    
  end
end