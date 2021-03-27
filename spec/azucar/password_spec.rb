RSpec.describe Azucar::PasswordValidator::PasswordValidator do
  before do
    allow(Azucar::PasswordValidator::Config).to receive(:min_password_length).and_return(8)
  end
  subject { Azucar::PasswordValidator::PasswordValidator.new }
  # NOTE: Use test doubles to decouple from configuration rules, validation
  # and other ever changing specifics of the app.
  # This test will continue to pass no matter how many times we change the configuration
  it 'rejects passwords shorter than the config' do
    expect(subject).not_to be_strong_enough('1234567')
  end

  it 'accepts passwords bigger than the config' do
    expect(subject).to be_strong_enough('12345678')
  end
end
