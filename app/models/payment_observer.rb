class PaymentObserver < ActiveRecord::Observer
  observe :payment

  def after_transition(payment, transition)
  end
end
