class Summary < ActiveRecord::Base
    belongs_to :post
    validates :post_id, presence:true
    
    def to_s
       description
    end
end
