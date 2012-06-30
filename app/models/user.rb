class User < ActiveRecord::Base
  attr_accessible :email, :icon_url, :name, :nickname, :provider, :uid

  def self.find_or_create_by_auth_hash(auth)
    user = User.find_or_create_by_provider_and_uid(auth['provider'], auth['uid'])
    user.update_attributes(
      name: auth['info']['name'],
      nickname: auth['info']['nickname'],
      icon_url: auth['info']['image'],
      email: auth['info']['email']
    )
    user
  end
end
