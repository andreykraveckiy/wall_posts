require 'spec_helper'

describe Post do
  
  let(:user) { FactoryGirl.create(:user) }
  before { @post = user.posts.build(content: "Lorem ipsum") }

  subject { @post }

  it { should respond_to(:content) }
  it { should respond_to(:comments) }

  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @post.user_id = nil }
    it { should_not be_valid }
  end

  describe "when content is not present" do
    before { @post.content = " " }
    it { should_not be_valid }
  end

  describe "comment associations" do

    before { @post.save }
    let!(:older_comment) { FactoryGirl.create(:comment, user: user, commentable: @post, created_at: 1.day.ago) }
    let!(:newer_comment) { FactoryGirl.create(:comment, user: user, commentable: @post, created_at: 1.hour.ago) }

    it "should have the right microposts in the right order" do
      expect(@post.comments.to_a).to eq [older_comment, newer_comment]
    end
  end
end
