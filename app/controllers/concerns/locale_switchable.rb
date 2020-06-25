module LocaleSwitchable
  extend ActiveSupport::Concern

  included do
    around_action :switch_locale
  end

  private

  def switch_locale(&action)
    locale = params[:lang]&.to_sym || cookies[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
    cookies[:locale] = locale
  end
end
