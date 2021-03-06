class Message < ActiveRecord::Base
  belongs_to :visitor
  validates :content, presence: true

  def self.matching_fullname_or_content params
  	joins(:visitor).where("fullname LIKE ? or Content LIKE ?", "%#{params}%","%#{params}%")
  end
   def mark_read
   	update(status: true) if status == false
   end
end
