require 'spec_helper'

describe "Pages" do
  subject { page }

  describe "signup page" do
    before  { visit unauthenticated_root_path }

    it { should have_link('guest', posts_path) }
    it { should have_link('Sign in with Vkontakte') }

    it "should have the right direction for 'guest' link" do
      click_link "guest"
      expect(page).to have_content('You are not signed in.')
    end
  end

  describe "index page" do

    describe "without unauthenticated user" do
      let(:user) { FactoryGirl.create(:user) }
      let!(:p1) { FactoryGirl.create(:post, user: user) }
      let!(:p2) { FactoryGirl.create(:post, user: user) }
      let!(:c1) { FactoryGirl.create(:comment, user: user, commentable: p1) }
      let!(:c2) { FactoryGirl.create(:comment, user: user, commentable: c1) }

      before { visit posts_path }
      
      it { should have_content('You are not signed in.') }
      it { should have_link("Sign in page", new_user_session_path) }

      it "should have the right direction for 'Sign in page' link" do
        click_link 'Sign in page'
        expect(page).to have_content('Sign in with Vkontakte')
      end

      describe "posts" do
        it { should have_content(p1.content) }
        it { should have_content(p2.content) }
      end

      describe "comments" do
        it { should have_content(c1.content) }
        it { should have_content(c2.content) }
      end
    end
  end

end