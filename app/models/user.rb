class User < ActiveRecord::Base
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.email = auth.info.email
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.karma = 0
      user.save!
    end
  end
  # validates :name, :presence => true
  # validates :year, :presence => true,
  #         :numericality => true
  # validates :major, :presence => true

  def self.text_search(query)
    if query.present?
      where("name ilike :q", q: "%#{query}%")
    else
      User.none
    end
  end
end
