class PaymentsController < ApplicationController
# GET /payments
@payment = Payment.new
def new

if current_user and current_user.stripe_customer_token
  customer = Stripe::Customer.retrieve(current_user.stripe_customer_token)
  @cc_last_4 = customer.active_card.last4
end

respond_to do |format|
def create
# POST /payments.json
  @payment = Payment.new(params[:payment])
  amount = params[:payment][:amount].to_f

  params[:payment][:user] = nil if params[:payment][:user] == ""

  respond_to do |format|
if @payment.save
format.html { redirect_to @payment, notice: 'Payment was successfully created.' }
format.json { render json: @payment, status: :created, location: @payment }
charge_info = {
  amount: (amount * 100).to_i,
  description: 'Stripe Example Charge',
  currency: 'usd'
 }

begin

if current_user
if current_user.stripe_customer_token
  customer = Stripe::Customer.retrieve(current_user.stripe_customer_token)

if params[:saved_card] == 'false'
  customer.card = params[:payment][:stripe_token]
  customer.save
end

else
customer = Stripe::Customer.create(
  :email => current_user.email,
  :card => params[:payment][:stripe_token]
)
current_user.update_attribute(:stripe_customer_token, customer.id)
end

charge = Stripe::Charge.create( charge_info.merge({ customer: customer.id }) )

params[:payment][:user] = current_user
else
  format.html { render action: "new" }
  format.json { render json: @payment.errors, status: :unprocessable_entity }
charge = Stripe::Charge.create( charge_info.merge({ card: params[:payment][:stripe_token] }) )

end

params[:payment][:stripe_token] = charge.id

@payment = Payment.new(params[:payment])


respond_to do |format|
if @payment.save
  format.html { redirect_to @payment, notice: 'Payment was successfully created.' }
  format.json { render json: @payment, status: :created, location: @payment }
else
  format.html { render action: "new" }
  format.json { render json: @payment.errors, status: :unprocessable_entity }
end
end
rescue Stripe::InvalidRequestError => e
redirect_to new_payment_path, notice: e.message
end
end