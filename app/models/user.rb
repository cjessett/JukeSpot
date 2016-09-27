class User < ApplicationRecord
  has_many :memberships
  has_many :parties, :through => :memberships

  def creds
    { "credentials" => { "token" => self.token, "refresh_token" => self.refresh_token }}
  end
end
