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

    describe "without authenticated user" do
      before { visit posts_path }
      
      it { should have_content('You are not signed in.') }
      it { should have_link("Sign in page", new_user_session_path) }

      it "should have the right direction for 'Sign in page' link" do
        click_link 'Sign in page'
        expect(page).to have_content('Sign in with Vkontakte')
      end
    end
  end

end