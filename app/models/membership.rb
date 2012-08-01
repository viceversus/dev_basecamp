class Membership < ActiveRecord::Base
  attr_accessible :member_id, :project_id

  belongs_to      :member, :class_name => "User"
  belongs_to      :project
end
