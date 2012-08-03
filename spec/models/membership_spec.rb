require 'spec_helper'

describe Membership do
  [:user, :project].each do |param|
    it { should belong_to(param) }
  end
end

# class Membership < ActiveRecord::Base
#   attr_accessible :user_id, :project_id
#
#   belongs_to      :user
#   belongs_to      :project
# end