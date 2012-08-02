class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible         :email, :password, :password_confirmation, :remember_me, :username
  validates_presence_of   :username
  validates_uniqueness_of :username

  has_many                :projects_as_owner, :class_name => "Project", :foreign_key => "owner_id"
  has_many                :memberships
  has_many                :projects_as_member, :through => :memberships, :source => :project


end