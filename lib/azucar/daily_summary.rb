module Azucar
  class DailySummary
    def initialize(sender: EmailSender.new)
      @sender = sender
    end

    def send_daily_summary(user_email, todays_messages)
      get_thread_id = ->(th) { th[:thread_id] }
      message_count = todays_messages.count
      thread_count = todays_messages.map(&get_thread_id).uniq.count
      header = 'Your daily message summary'
      body = "You missed #{message_count} messages " \
      "in #{thread_count} threads today"
      @sender.deliver(to: 'gerson', from: user_email, header: header, body: body)
    end
  end

  class EmailSender
    def deliver(to:, from:, header:, body:)
      true
    end
  end
end
