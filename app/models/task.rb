class Task < ActiveRecord::Base
  attr_accessible :completed_at, :description, :list_id

  validates_presence_of   :description, :list

  belongs_to :list, :inverse_of => :tasks
  delegate :project, :to => :list
end
