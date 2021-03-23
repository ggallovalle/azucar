RSpec.describe 'Block implementations that provide responses' do
  let(:test_double) { double }

  it 'can return a value' do
    # Arrange
    allow(test_double).to receive(:message) do
      17
    end
    # Assert
    expect(test_double.message).to eq(17)
  end
  it 'can raise an error' do
    # Arrange
    allow(test_double).to receive(:message) do
      raise StandardError, 'kboom with this method'
    end
    # Assert
    expect { test_double.message }.to raise_error(/boom/)
  end

  it 'can yield a value' do
    # Arrange
    allow(test_double).to receive(:message) do |&block|
      block.call(1)
    end
    # Assert
    expect { |b| test_double.message(&b) }.to yield_with_args(1)
  end

  it 'can throw a symbol' do
    # Arrange
    allow(test_double).to receive(:message) do
      throw :foo
    end
    # Assert
    expect { test_double.message }.to throw_symbol(:foo)
  end
end

RSpec.describe 'Block implementations that check calls' do
  let(:test_double) { double }

  it 'can constrain arguments' do
    # Arrange
    allow(test_double).to receive(:message) do |arg|
      raise arg.to_s unless arg == :valid_arg
    end
    # Assert
    expect { test_double.message(:valid_arg) }.to_not raise_error
    expect { test_double.message(:invalid_arg) }.to raise_error(/invalid_arg/)
  end

  context 'can count how many times the message was received' do
    it 'custom way' do
      # Arrange
      receive_count = 0
      allow(test_double).to receive(:message) do |&block|
        block.call(10) if block_given?
        receive_count += 1
      end
      # Act
      test_double.message
      test_double.message
      # Assert
      expect(receive_count).to eq(2)
    end
    it 'rspec way' do
      # Arrange
      allow(test_double).to receive(:message)
      # Act
      test_double.message
      test_double.message
      # Assert
      expect(test_double).to have_received(:message).twice
    end
  end

  context 'can constrain the order messages were received in' do
    it 'custom way' do
      # Arrange
      sequence = []
      allow(test_double).to receive(:message_1) do
        # NOTE: it doesn't recognize the name of the current method
        # because it ain't no method, is a block
        #   sequence.push(__method__.to_s)
        sequence.push(:message_1)
      end
      allow(test_double).to receive(:message_2) do
        sequence.push(:message_2)
      end
      # Act
      test_double.message_1
      test_double.message_2
      test_double.message_1
      # Assert
      expect(sequence).to eq(%i[message_1 message_2 message_1])
    end
    it 'rspec way' do
      # Arrange
      expect(test_double).to receive(:message_1).ordered
      expect(test_double).to receive(:message_2).ordered
      # Act
      test_double.message_1
      test_double.message_2
    end
  end
end
