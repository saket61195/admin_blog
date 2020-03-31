class Post < ActiveRecord::Base
  belongs_to :moderator
  has_many :post_tags, dependent: :destroy
  has_many :comments,dependent: :destroy
  has_many :tags, through: :post_tags

  validates :title, presence: true
  validates :content, presence: true
  
  def self.matching_title_or_content search
  	where("title Like? or content Like?","%#{search}%","%#{search}%")
  end
end
