#encoding: utf-8
FactoryGirl.define do 
	factory :user do 
		userid 1
		name "矢上　太郎"
		email "test@example.com"
		group "矢上祭実行委員会"
		password "foobar"
		password_confirmation "foobar"

		factory :admin do 
			admin true
		end
	end
end