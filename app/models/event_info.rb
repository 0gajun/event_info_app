class EventInfo < ActiveRecord::Base
	mount_uploader :image_url, EventImageUploader
	
	validates(:title, presence: true)
	validates(:placeid, presence: true)
	validates(:categoryid, presence: true)
	validates(:description, presence: true, length: { maximum: 500 })
	validates(:userid, presence: true)
end
