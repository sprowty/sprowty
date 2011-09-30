class PaymentsController < ApplicationController
  respond_to :html, :json

  include ActiveMerchant::Billing::Integrations
  require 'crypto'
  require 'money'

  def new
    @payment = Payment.new
  end

  def create
    @payment = current_user.payments.new(params[:payment])

    if @payment.save
      render :json => { :success => true }
    else
      @payment = Payment.find(params[:payment_id])
      render :json => { :success => 'false', :html => render_to_string(:file => 'new.html.erb', :template => false) }
    end
  end

  def place_order
    #@project = Project.find(params[:project_id])

   # if @logged_user#.credits > 0
   #   render(:action => "confirm_order")
   #   return
   # else
      #place order will have our paypal buttons
      render(:action => "place_order")
   #   return
   # end
  end

private
  def fetch_decrypted(project = nil)

    # cert_id is the certificate if we see in paypal when we upload our own certificates
    # cmd _xclick need for buttons
    # item name is what the user will see at the paypal page
    # custom and invoice are passthrough vars which we will get back with the asunchronous
    # notification
    # no_note and no_shipping means the client want see these extra fields on the paypal payment
    # page
    # return is the url the user will be redirected to by paypal when the transaction is completed.
    decrypted = {
      "cert_id" => "9LHCT27AYFL78",
      "cmd" => "_xclick",
      "business" => "sprowt_1317256762_biz@sprowty.com",
      "item_name" => "1 Togun",
      "item_number" => "1",
      "custom" =>"something to pass to IPN",
      "amount" => "5",
      "currency_code" => "USD",
      "country" => "US",
      "no_note" => "1",
      "no_shipping" => "1"
    }

    if project
      decrypted.merge!("invoice" => "Another passthrough var", "return" => "http://www.sprowty.com/payments/done?project_id=#{project.id}")
    else
      decrypted.merge!("return" => "http://www.sprowty.com/payments/done")
    end

    @encrypted_basic = Crypto42::Button.from_hash(decrypted).get_encrypted_text
    @action_url = PAYPAL_ACCOUNT
  end
end
