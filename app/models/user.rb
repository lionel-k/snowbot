class User < ApplicationRecord
  # after_create :send_welcome_email
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, #:registerable,
  # :recoverable,
  :rememberable, :trackable, :validatable

  devise :omniauthable, omniauth_providers: [:facebook]

  has_many :orders
  has_many :offers

  def self.find_for_facebook_oauth(auth, offer=nil)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at) unless auth.credentials.expires_at.nil?
    user_params = user_params.to_h

    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.

    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    # reconcicialiton user entre FB login (provider + uid) et FB messenger (psid + query)
    if offer && offer.user != user
      fake_offer_user = offer.user

      user.update(psid: fake_offer_user.psid, query: fake_offer_user.query)
      fake_offer_user.offers.update(user_id: user.id)
      fake_offer_user.destroy
    end

    return user
  end

  private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end

end
