class Post < ActiveRecord::Base
  attr_accessible :name, :title, :active, :content
  has_many :comments
  belongs_to :users
end
