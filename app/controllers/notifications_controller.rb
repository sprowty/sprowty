class NotificationsController < ApplicationController
  def notify
    notify = ActiveMerchant::Billing::Integrations::Paypal::Notification.new(request.raw_post)

    @transaction = Transaction.where(:paypal_transaction_id => notify.transaction_id).first

    if @transaction.blank?
      logger.debug("no transaction present")
      @transaction = Transaction.new
    else
      logger.debug("transaction already present")
    end

    if notify.acknowledge
      begin
        if notify.complete?
          logger.debug("transaction complete")
          @transaction.paypal_transaction_id = notify.transaction_id
          @transaction.save
        else
          logger.error("transaction did not complete")
        end
      rescue => e
        logger.error(e)
      end
    else
      logger.error("transaction was not acknowledged")
    end

  render :nothing => true
  end
end
