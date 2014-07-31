namespace :db do
	desc "fill database with sample data"
	task populate: :environment do 
		User.create!(name: "小笠原純也",
					email: "foo@example.com",
					group: "矢上祭実行委員会",
					staff: false,
					admin: true,
					password: "foobar",
					password_confirmation: "foobar"
					)
		User.create!(name: "スタッフ",
					email: "staff@example.com",
					group: "矢上祭実行委員会",
					staff: true,
					password: "foobar",
					password_confirmation: "foobar"
					)
		User.create!(name: "岡田けんと",
					email: "okada@example.com",
					group: "矢上祭実行委員会",
					staff: true,
					password: "foobar",
					password_confirmation: "foobar"
					)
		User.create!(name: "石塚友",
					email: "isiduka@example.com",
					group: "矢上祭実行委員会",
					staff: true,
					password: "foobar",
					password_confirmation: "foobar"
					)
		User.create!(name: "白岩ゆり",
					email: "shiraiwa@example.com",
					group: "矢上祭実行委員会",
					staff: true,
					password: "foobar",
					password_confirmation: "foobar"
					)
		User.create!(name: "佐藤楓",
					email: "sato@example.com",
					group: "矢上祭実行委員会",
					staff: true,
					password: "foobar",
					password_confirmation: "foobar"
					)
		45.times do |n|
			name = Faker::Japanese::Name.name
			email = "example-#{n+1}@example.com"
			password = "foobar"
			User.create!(name: name,
					email: email,
					group: "参加者",
					password: password,
					password_confirmation: password
					)
		end
	end
end