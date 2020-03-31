class Post < ActiveRecord::Base
  belongs_to :moderator
  has_many :comments
  has_many :tags, through: :post_tags
  def self.matching_title_or_content search
  	where("title Like? or content Like?","%#{search}%","%#{search}%")
  end
end
