class List < ActiveRecord::Base
  attr_accessible :project_id, :title, :tasks_attributes

  validates_presence_of :project, :title

  belongs_to  :project
  has_many    :tasks, :dependent => :destroy, :inverse_of => :list

  accepts_nested_attributes_for :tasks, :allow_destroy => true, :reject_if => lambda { |t| t[:description].blank? }

end
