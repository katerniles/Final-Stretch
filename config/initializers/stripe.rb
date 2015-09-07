  Rails.configuration.stripe = {

#    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'] ||
#   "pk_test_ebHWWqUGlFUT8MoRRgsHsi04",
#    :secret_key      => ENV['STRIPE_SECRET_KEY']
  :publishable key => Rails.application.secrets.publishable_key
  :secret key      => Rails.application.secrets.secret_key

}
Stripe.api_key = Rails.configuration.stripe[:secret_key]