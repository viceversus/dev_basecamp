class Project < ActiveRecord::Base
  attr_accessible :description, :owner_id, :public, :title
  belongs_to      :owner, :class_name => "User"
  has_many        :members, :through => :memberships


end
