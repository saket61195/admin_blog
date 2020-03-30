class Post < ActiveRecord::Base
  belongs_to :moderator
  has_many :comments
  has_many :tags, through: :post_tags
end
