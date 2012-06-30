# coding: utf-8
class User < ActiveRecord::Base
  attr_accessible :email, :icon_url, :name, :nickname, :provider, :uid
                  :token, :secret

  # relations
  has_many :jobs # 依頼主として
  has_many :groups # グループ作成主として
  has_many :memberships
  has_many :my_groups, :through => :memberships # 自分の所属するグループ
  has_many :my_jobs, :through => :my_groups # 自分が見られる仕事

  def self.find_or_create_by_auth_hash(auth)
    user = User.find_or_create_by_provider_and_uid(auth['provider'], auth['uid'])
    user.update_attributes(
      name: auth['info']['name'],
      nickname: auth['info']['nickname'],
      icon_url: auth['info']['image'],
      email: auth['info']['email'],
      token: auth['credentials']['token'],
      secret: auth['credentials']['secret']
    )
    user
  end
end
