class User < ActiveRecord::Base
  attr_accessible :email, :icon_url, :name, :nickname, :provider, :uid
end
