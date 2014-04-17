class Comment < ActiveRecord::Base
   attr_accessible :name, :comment
   belongs_to :posts
   belongs_to :users
end
