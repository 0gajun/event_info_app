class EventInfo < ActiveRecord::Base

	validates(:title, presence: true)
	validates(:placeid, presence: true)
	validates(:categoryid, presence: true)
	validates(:description, presence: true, length: { maximum: 500 })
	validates(:userid, presence: true)
end
