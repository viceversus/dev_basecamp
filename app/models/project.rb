class Project < ActiveRecord::Base
  attr_accessible :description, :owner_id, :restricted, :title

  belongs_to      :owner,       :class_name   => "User"
  has_many        :memberships, :dependent    => :destroy
  has_many        :members,     :through      => :memberships
  has_many        :lists,       :dependent    => :destroy
  has_many        :tasks,       :through      => :lists

  validates_presence_of   :title, :description, :owner

end
