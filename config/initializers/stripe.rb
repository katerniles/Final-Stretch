Stripe.api_key = Rails.env.production? ?
                 Rails.configuration.stripe[:secret_key] :
                 Settings[Rails.env]['stripe']['secret_key']