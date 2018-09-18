class SnsUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :validatable,
       :omniauthable, omniauth_providers: %i(google facebook twitter github)

  def self.create_unique_string
    SecureRandom.uuid
  end

  def self.find_for_google(auth)
    sns_user = SnsUser.find_by(email: auth.info.email)

    unless sns_user
      sns_user = SnsUser.new(email: auth.info.email,
                      provider: auth.provider,
                      uid:      auth.uid,
                      password: Devise.friendly_token[0, 20],
                                   )
    end
    sns_user.save
    sns_user
  end

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    sns_user = SnsUser.find_by(provider: auth.provider, uid: auth.uid)

    unless sns_user
      sns_user = SnsUser.new(provider: auth.provider,
                      uid:      auth.uid,
                      email:    "#{auth.uid}-#{auth.provider}@example.com",
                      password: Devise.friendly_token[0, 20]
      )
    end
    sns_user.save
    sns_user
  end

  def self.find_for_github_oauth(auth, signed_in_resource=nil)
    sns_user = SnsUser.find_by(provider: auth.provider, uid: auth.uid)

    unless sns_user
      sns_user = SnsUser.new(provider: auth.provider,
                      uid:      auth.uid,
                      email:    "#{auth.uid}-#{auth.provider}@example.com",
                      password: Devise.friendly_token[0, 20]
      )
    end
    sns_user.save
    sns_user
  end
end
