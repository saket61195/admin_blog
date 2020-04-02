class Setting < ActiveRecord::Base
	def self.site_name
		Setting.first.try(:site_name)
	end

	def self.post_per_page
		Setting.first.try(:post_per_page)
	end
	
	def self.tag_visible?
		Setting.first.try(:tag_visibility)
	end
end
