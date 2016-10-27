require 'spec_helper'

describe User do
  before { @user = User.new( ) }
  subject { @user }

  # test fields, whitch were added in this app
  it { should respond_to(:name) }
  it { should respond_to(:uid) }
  it { should respond_to(:provider) }
  # dependencies
  it { should respond_to(:posts) }
  it { should respond_to(:comments) }
  # methods
  # it { should respond_to(:from_omniauth) }
  it { should be_valid }

  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end
end