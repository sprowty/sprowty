class TransactionsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :json

  include ActiveMerchant::Billing::Integrations
  require 'money'

  def new
    @payment = Transaction.new
    render :layout => false
  end

  def create
    #This is the method where the HTML form is created and is posted to paypal
  end
end
