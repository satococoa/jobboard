class Membership < ActiveRecord::Base
  attr_accessible :member_id, :user_id
  belongs_to :user
  has_many :member, :class_name => 'User'
end
