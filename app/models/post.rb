class Post < ActiveRecord::Base
  belongs_to :moderator
  has_many :post_tags, dependent: :destroy
  has_many :comments,dependent: :destroy
  has_many :tags, through: :post_tags

  validates :title, presence: true
  validates :content, presence: true

  scope :published, -> {where(publish: true).order(id: :desc)}
  
  def self.matching_title_or_content search
  	where("title Like? or content Like?","%#{search}%","%#{search}%")
  end
  def self.fiter_by_tags params_tag
  	includes(:tags).where(publish: true, tags:{name: params_tag}).order(id: :desc)
  end
end
