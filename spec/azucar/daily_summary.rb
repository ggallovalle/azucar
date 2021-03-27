RSpec.describe Azucar::DailySummary do
  it 'calls send email method' do
    # Arrange
    email_sender = instance_spy(Azucar::EmailSender)
    summary = described_class.new(sender: email_sender)
    todays_messages = [
      { thread_id: 1, name: 'Gerson' },
      { thread_id: 2, name: 'Managua' },
      { thread_id: 1, name: 'Gerson' }
    ]
    # Act
    summary.send_daily_summary('gerson@gmail.com', todays_messages)
    # Assert
    expect(email_sender).to have_received(:deliver).with(hash_including(body:
        'You missed 3 messages in 2 threads today'))
  end
end
