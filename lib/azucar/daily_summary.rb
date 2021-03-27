module Azucar
  module DailySummary
    # Send daily summary
    class DailySummary
      def initialize(sender: EmailSender.new)
        @sender = sender
      end

      def send_daily_summary(user_email, today_messages)
        get_thread_id = ->(th) { th[:thread_id] }
        message_count = today_messages.count
        thread_count = today_messages.map(&get_thread_id).uniq.count
        header = 'Your daily message summary'
        body = "You missed #{message_count} messages " \
      "in #{thread_count} threads today"
        @sender.deliver(to: 'gerson', from: user_email, header: header, body: body)
      end
    end

    # Fake implementation of a EmailSender
    class EmailSender
      def deliver(to:, from:, header:, body:)
        {to: to, from: from, header: header, body: body}
      end
    end

  end
end
