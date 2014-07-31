class Subplace < ActiveRecord::Base
	validates(:name, presence: true)
end

