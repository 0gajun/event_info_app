#encoding: utf-8
require 'spec_helper'

describe "UserPages" do
	subject { page }
  describe "User create page" do
  	before { visit create_user_path }
  	it { expect(subject).to have_content('ユーザ登録') }
  	it { expect(subject).to have_title(full_title('ユーザ登録')) }
  end

  describe "User my_page" do 
  	let(:user) { FactoryGirl.create(:user) }
  	before do 
      sign_in user
      visit my_page_path
    end
    it { expect(subject).to have_content(user.name) }
    it { expect(subject).to have_title(full_title('マイページ')) }
  end

  describe "index(users list) page" do 
    let(:non_admin_user) { FactoryGirl.create(:user) }
    let(:admin_user) { FactoryGirl.create(:admin) }
    describe "when non-admin-user attempt to access" do 
      before do 
        sign_in non_admin_user
        visit users_path
      end
      it { expect(subject).to have_content('マイページ') }
      it { expect(subject).to have_selector('div.alert.alert-warning', text: "権限がありません") }
    end
    describe "when admin-user attempt to access" do 
      before do 
        sign_in admin_user
        visit users_path
      end
      it { expect(subject).to have_content('ユーザ一覧') }
      it { expect(subject).not_to have_selector('div.alert.alert-warning', text: "権限がありません") }
    end
  end

  describe "create user" do 
  	before { visit create_user_path }
  	let(:submit) { "作成" }

  	describe "with invalid information" do 
  		it "don't create an user" do
	  		expect { click_button submit }.not_to change(User, :count)
	  	end
  	end

  	describe "with valid information" do 
  		before do 
  			fill_in "名前",				with: "矢上　二郎"
  			fill_in "メールアドレス",		with: "test@example.com"
  			fill_in "団体名",			with: "矢上祭実行委員会"
  			fill_in "パスワード",			with: "foobar"
  			fill_in "パスワード(確認)",	with: "foobar"
  		end
  		it "create an user" do 
  			expect { click_button submit }.to change(User, :count).by(1)
  		end
      describe "after saving the user" do 
        before { click_button submit }

        it { expect(subject).to have_content('ユーザ（矢上　二郎）が作成されました') }
      end 
	  end
  end

  describe "edit" do 
    let(:user) { FactoryGirl.create(:user) }
    before do 
     sign_in user
     visit edit_user_path(user)
    end
    describe "page" do 
      it { expect(subject).to have_title(full_title('ユーザ情報編集')) }
      it { expect(subject).to have_content('ユーザ情報編集') }
    end
    describe "with invalid information" do 
      before { click_button "変更を保存" }
      it { expect(subject).to have_content('エラー') }
    end
    describe "with valid information" do 
      let(:new_name) { "変更　テスト" }
      let(:new_email) { "change@test.com" }
      let(:new_group) { "変更テスト" }
      before do 
        fill_in "名前",       with: new_name
        fill_in "メールアドレス",    with: new_email
        fill_in "団体名",      with: new_group
        fill_in "パスワード",      with: user.password
        fill_in "パスワード(確認)",  with: user.password
        click_button "変更を保存"
      end

      it { expect(subject).to have_content(new_name) }
      it { expect(subject).to have_selector('div.alert.alert-success') }
      it { expect(subject).to have_link('ログアウト', href: signout_path) }
      specify { expect(user.reload.name).to eq new_name }
      specify { expect(user.reload.email).to eq new_email }
      specify { expect(user.reload.group).to eq new_group }
    end
  end
end
