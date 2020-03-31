class Tag < ActiveRecord::Base
	has_many :posts, through: :posts_tags

	def in_use?
		PostTag.exists?(tag_id: self.id)
	end
end
