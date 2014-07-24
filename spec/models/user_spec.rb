require 'spec_helper'

describe User do
  before { @user = User.new(userid: "1",
  							name: "foo bar",
  							email: "foo_bar@example.com",
  							group: "OBOG会",
  							staff: false,
  							admin: false
  							) }

  	subject { @user }
  	it { should respond_to(:name) }
  	it { should respond_to(:userid) }
  	it { should respond_to(:email) }
    it { should respond_to(:password_digest) }
  	it { should respond_to(:group) }
  	it { should respond_to(:staff) }
  	it { should respond_to(:admin) }

    describe "when name is not present" do 
      before { @user.name = " " }
      it { expect(subject).not_to be_valid }
    end
    describe "when email is not present" do 
      before { @user.email = " " }
      it { expect(subject).not_to  be_valid }
    end
    describe "when userid is not present" do 
      before { @user.userid = " "}
      it { expect(subject).not_to be_valid }
    end
    describe "when group is not present" do 
      before { @user.group = " "}
      it { expect(subject).not_to be_valid }
    end

    describe "when email format" do 
      describe "is invalid" do 
        it "is invalid" do 
          addresses = %w[user@foo,com user_at_foo.org 
            example.user@foo. foo@bar_baz.com foo@bar+baz.com foo@bar..com]

          addresses.each do |invalid_address|
            @user.email = invalid_address
            expect(subject).not_to be_valid
          end
        end
      end
      describe "is valid" do 
        it "is valid" do 
          addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
          addresses.each do |valid_address|
            @user.email = valid_address
            expect(subject).to be_valid
          end
        end
      end
    end

    describe "when email is already taken" do 
      before do 
        user_with_same_email = @user.dup
        user_with_same_email.email = @user.email.upcase
        user_with_same_email.save
      end
      it { expect(subject).not_to be_valid }
    end

end
