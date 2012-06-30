class Group < ActiveRecord::Base
  attr_accessible :title, :user_id
  has_many :memberships
  has_many :members, :through => :memberships
  has_many :jobs
end
