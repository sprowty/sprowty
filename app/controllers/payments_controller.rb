class PaymentsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :json

  include ActiveMerchant::Billing::Integrations
  require 'money'

  def new
    @payment = Payment.new
  end

  def create
    #This is the method where the HTML form is created and is posted to paypal
  end

  def notify
    p request.inspect
    ipn
  end

  def ipn
    #This is the method that takes care of checking the request object sending the request object again to paypal to check whether
    #the request is confirmed or genuine, then it logs the corresponding message to a file.
    notify = Paypal::Notification.new(request.raw_post)
    if notify.acknowledge
      begin
        if notify.complete?
          logger.debug "Transaction complete.. add your business logic here"
        else
          logger.debug "Transaction not complete, ERROR"
        end
      rescue => e
        logger.error("error occurred with paypal process")
      ensure
      end
    else
    end
    render :nothing => true
  end
end
