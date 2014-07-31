require 'spec_helper'

describe EventInfo do
	before { @event = EventInfo.new(title: 'ガミラジ',
									placeid: 1,
									subplace: "",
									categoryid: 1,
									firstday_time: '12:00~',
									secondday_time: '12:00~',
									description: 'かくかくしかじか',
									image_url: 'http://sss.com',
									movie_url: 'http://sss.com',
									userid: 2)}

	subject { @event }

	it { expect(subject).to respond_to(:title) }
	it { expect(subject).to respond_to(:placeid) }
	it { expect(subject).to respond_to(:subplace) }
	it { expect(subject).to respond_to(:categoryid) }
	it { expect(subject).to respond_to(:firstday_time) }
	it { expect(subject).to respond_to(:secondday_time) }
	it { expect(subject).to respond_to(:description) }
	it { expect(subject).to respond_to(:image_url) }
	it { expect(subject).to respond_to(:movie_url) }
	it { expect(subject).to respond_to(:userid) }
	it { expect(subject).to respond_to(:pending_approval) }
	it { expect(subject).to respond_to(:reject_status) }
	it { expect(subject).to respond_to(:reject_message) }

	describe "when title is not present" do 
		before { @event.title = " " }
		it { expect(subject).not_to be_valid }
	end
	describe "when placeid is not presetn" do 
		before { @event.placeid = " " }
		it { expect(subject).not_to be_valid }
	end
	describe "when categoryid is not present" do 
		before { @event.categoryid = " " }
		it { expect(subject).not_to be_valid }
	end 
	describe "when description is not present" do 
		before { @event.description = " " }
		it { expect(subject).not_to be_valid }
	end
	describe "when userid is not present" do 
		before { @event.userid = " " }
		it { expect(subject).not_to be_valid }
	end

	describe "when description is too long" do 
		before { @event.description = "あ" * 501 }
		it { expect(subject).not_to be_valid }
	end
end
