class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  before_action :set_offer, only: :facebook

  def facebook
    user = User.find_for_facebook_oauth(request.env['omniauth.auth'], @offer)

    if user.persisted?
      sign_in_and_redirect user, event: :authentication
      set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
      session[:current_offer_id] = nil
    else
      session['devise.facebook_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end

  end

  private

  def set_offer
    return unless session[:current_offer_id]

    @offer = Offer.find(session[:current_offer_id])
  end
end
