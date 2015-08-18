 FactoryGirl.define do
   factory :user do
     name "Douglas Adams"
     sequence(:email, 100) { |n| "person#{n}@example.com" }
     password "helloworld"
     password_confirmation "helloworld"
     confirmed_at Time.now
     
     
     factory :user_with_post_and_comment do
       transient do
          user true
       end
      
        after(:build) do |user, evaluator|
          user.name.upcase! if evaluator.upcased
        end
     end
   end
 end