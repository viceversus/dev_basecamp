class Project < ActiveRecord::Base
  attr_accessible :description, :owner_id, :private, :title
  belongs_to      :owner, :class_name => "User"
  has_many        :memberships
  has_many        :members, :through => :memberships


  validates_presence_of   :title, :description, :owner

end
