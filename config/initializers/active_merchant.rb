if Rails.env.production?
  PAYPAL_ACCOUNT = 'production.paypal.account@domain.com'
else
  PAYPAL_ACCOUNT = 'test.paypal.account@domain.com'
  ActiveMerchant::Billing::Base.mode = :test
  ActiveMerchant::Billing::Base.gateway_mode = :test
  ActiveMerchant::Billing::Base.integration_mode = :test
  ActiveMerchant::Billing::PaypalGateway.pem_file = File.read(File.dirname(__FILE__) + '/../paypal/paypal_cert.pem')
end
