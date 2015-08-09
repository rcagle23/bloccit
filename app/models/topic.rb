class Topic < ActiveRecord::Base
    has_many :posts, dependent: :destroy
    scope :visible_to, -> (user) { user ? all : where(publicly_viewable) }
    scope :privately_viewable, -> { where(public: false) }
    scope :publicly_viewable, -> { where(public: true) }
end
