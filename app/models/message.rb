class Message < ActiveRecord::Base
  belongs_to :sender, :polymorphic => true
  has_many :recipients, :class_name => 'MessageRecipient', :order => 'kind DESC, position ASC', :dependent => :destroy

  #this is a temporary solution - needs to be in a queue process
  after_create :deliver_message

  validates_presence_of :state, :sender_id, :sender_type

  attr_accessible :subject, :body, :to, :cc, :bcc

  after_save :update_recipients

  named_scope :visible, :conditions => {:hidden_at => nil}

  # Define actions for the message
  state_machine :state, :initial => :unsent do
    # Queues the message so that it's sent in a separate process
    event :queue do
      transition :unsent => :queued, :if => :has_recipients?
    end

    # Sends the message to all of the recipients as long as at least one
    # recipient has been added
    event :deliver do
      transition [:unsent, :queued] => :sent, :if => :has_recipients?
    end
  end

  # Defines actions for the visibility of the message
  state_machine :hidden_at, :initial => :visible do
    # Hides the message from the recipient's inbox
    event :hide do
      transition all => :hidden
    end

    # Makes the message visible in the recipient's inbox
    event :unhide do
      transition all => :visible
    end

    state :visible, :value => nil
    state :hidden, :value => lambda {Time.now}, :if => lambda {|value| value}
  end

  # Directly adds the receivers on the message (i.e. they are visible to all recipients)
  def to(*receivers)
    receivers(receivers, 'to')
  end
  alias_method :to=, :to

  # Carbon copies the receivers on the message
  def cc(*receivers)
    receivers(receivers, 'cc')
  end
  alias_method :cc=, :cc

  # Blind carbon copies the receivers on the message
  def bcc(*receivers)
    receivers(receivers, 'bcc')
  end
  alias_method :bcc=, :bcc

  # Forwards this message, including the original subject and body in the new
  # message
  def forward
    message = self.class.new(:subject => subject, :body => body)
    message.sender = sender
    message
  end

  # Replies to this message, including the original subject and body in the new
  # message. Only the original direct receivers are added to the reply.
  def reply
    message = self.class.new(:subject => subject, :body => body)
    message.sender = sender
    message.to(to)
    message
  end

  # Replies to all recipients on this message, including the original subject
  # and body in the new message. All receivers (direct, cc, and bcc) are added
  # to the reply.
  def reply_to_all
    message = reply
    message.cc(cc)
    message.bcc(bcc)
    message
  end

  private
    # Create/destroy any receivers that were added/removed
    def update_recipients
      if @receivers
        @receivers.each do |kind, receivers|
          kind_recipients = recipients.select {|recipient| recipient.kind == kind}
          new_receivers = receivers - kind_recipients.map(&:receiver)
          removed_recipients = kind_recipients.reject {|recipient| receivers.include?(recipient.receiver)}

          recipients.delete(*removed_recipients) if removed_recipients.any?
          new_receivers.each {|receiver| self.recipients.create!(:receiver => receiver, :kind => kind)}
        end

        @receivers = nil
      end
    end

    # Does this message have any recipients on it?
    def has_recipients?
      (to + cc + bcc).any?
    end

    # Creates new receivers or gets the current receivers for the given kind (to, cc, or bcc)
    def receivers(receivers, kind)
      if receivers.any?
        (@receivers ||= {})[kind] = receivers.flatten.compact
      else
        @receivers && @receivers[kind] || recipients.select {|recipient| recipient.kind == kind}.map(&:receiver)
      end
    end

    def deliver_message
      deliver
    end
end
