class NotificationsController < ApplicationController
  def ipn
    # Create a notify object we must
    notify = Paypal::Notification.new(request.raw_post)

    #we must make sure this transaction id is not allready completed
    if !Trans.count("*", :conditions => ["paypal_transaction_id = ?", notify.transaction_id]).zero?
       # do some logging here...
    end

    if notify.acknowledge
      begin
        if notify.complete?
           #transaction complete.. add your business logic here
        else
           #Reason to be suspicious
        end

      rescue => e
        #Houston we have a bug
      ensure
        #make sure we logged everything we must
      end
    else #transaction was not acknowledged
      # another reason to be suspicious
    end
  end
end
