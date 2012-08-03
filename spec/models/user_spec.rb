require 'spec_helper'

describe User do
  subject { create(:user) }

  [:projects_as_owner, :projects_as_member, :memberships].each do |param|
    it { should have_many(param) }
  end

  [:username, :email].each do |param|
    it { should validate_uniqueness_of(param) }
  end

  [:username, :email, :password].each do |param|
    it { should validate_presence_of(param) }
  end

  it { should validate_format_of(:username).not_with("a a").with_message("Only A-Z, a-z, 0-9, and _ allowed.") }
  it { should_not allow_value("a a").for(:username).with_message("Only A-Z, a-z, 0-9, and _ allowed.") }
  it { should_not allow_value("adsb.").for(:username) }
end
