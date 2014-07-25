class User < ActiveRecord::Base
	before_save{ email.downcase! }

	validates(:name, presence: true, length: { maximum: 20 })

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates(:email, presence: true, format: { with: VALID_EMAIL_REGEX },
					uniqueness: { case_sensitive: false } )
	#validates(:userid, presence: true)
	validates(:group, presence: true)
	validates(:password, length: { minimum: 6 } )
	
	has_secure_password


end
