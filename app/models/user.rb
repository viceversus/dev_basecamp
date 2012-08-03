class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible         :email, :password, :password_confirmation, :remember_me, :username
  validates               :username,  :presence => true,
                                      :uniqueness => true,
                                      :format => { :with => /^\w+$/i, :message => "Only A-Z, a-z, 0-9, and _ allowed." }

  has_many                :projects_as_owner, :class_name => "Project", :foreign_key => "owner_id"
  has_many                :memberships
  has_many                :projects_as_member, :through => :memberships, :source => :project


end