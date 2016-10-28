require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.create(:user) }
  subject { user }

  # test fields, whitch were added in this app
  it { should respond_to(:name) }
  it { should respond_to(:uid) }
  it { should respond_to(:provider) }
  # dependencies
  it { should respond_to(:posts) }
  it { should respond_to(:comments) }
  
  it { should be_valid }

  describe "when name is not present" do
    before { user.name = " " }
    it { should_not be_valid }
  end

  describe "post associations" do

    before { user.save }
    let!(:older_post) { FactoryGirl.create(:post, user: user, created_at: 1.day.ago) }
    let!(:newer_post) { FactoryGirl.create(:post, user: user, created_at: 1.hour.ago) }

    it "should have the right microposts in the right order" do
      expect(user.posts.to_a).to eq [newer_post, older_post]
    end
  end
end