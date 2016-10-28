require 'spec_helper'

describe Comment do

  let(:user) { FactoryGirl.create(:user) }
  let(:post) { FactoryGirl.create(:post, user: user) }
  let(:comment) { FactoryGirl.create(:comment, user: user, commentable: post) }

  subject { comment }

  it { should respond_to(:content) }

  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

  it { should respond_to(:commentable) }
  it { should respond_to(:commentable_type) }
  it { should respond_to(:commentable_id) }
  its(:commentable) { should eq post }

  it { should respond_to(:comments) }
  
  it { should be_valid }

  describe "when user_id is not present" do
    before { comment.user_id = nil }
    it { should_not be_valid }
  end

  describe "when user_id is not present" do
    before { comment.commentable = nil }
    it { should_not be_valid }
  end

  describe "when content is not present" do
    before { comment.content = " " }
    it { should_not be_valid }
  end

  describe "when the comment belongs to another comment" do
    let!(:comment_of_comment) { FactoryGirl.create(:comment, user: user, commentable: comment) }
    subject { comment_of_comment }

    it { should be_valid }
  end
end
