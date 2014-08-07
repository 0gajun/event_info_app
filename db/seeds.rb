# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create(name: "観る")
Category.create(name: "体験する")
Category.create(name: "遊ぶ")
Category.create(name: "買う")
Category.create(name: "その他")

Place.create(name: "12棟")
Place.create(name: "ステージ")
Place.create(name: "グラウンド")
Place.create(name: "14棟")
Place.create(name: "模擬店ロード")

User.create!(name:"admin",
			email:"admin@example.com",
			group:"矢上祭実行委員会",
			admin: true,
			password: "foobar",
			password_confirmation: "foobar"
			)

CurrentRevisions.create(table_name: "event_infos", revision: 0)
CurrentRevisions.create(table_name: "categories", revision: 0)
CurrentRevisions.create(table_name: "places", revision: 0)
