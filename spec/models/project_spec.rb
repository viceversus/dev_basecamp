require 'spec_helper'

describe Project do

  subject { create(:project) }

  [:members, :memberships].each do |param|
    it { should have_many(param) }
  end

  [:title, :description, :owner].each do |param|
    it { should validate_presence_of(param) }
  end


  it { should belong_to(:owner) }
end