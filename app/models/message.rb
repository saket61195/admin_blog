class Message < ActiveRecord::Base
  belongs_to :visitor

  def self.matching_fullname_or_content params
  	joins(:visitor).where("fullname LIKE ? or Content LIKE ?", "%#{params}%","%#{params}%")
  end
end
