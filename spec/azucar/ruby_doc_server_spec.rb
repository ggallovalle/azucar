require 'stringio'

RSpec.describe Azucar::RubyDocServer::RubyDocServer do
  # we are setting expectations on the contents of the response
  # rather than on how it was produced
  # this results in much less brittle specs
  it 'should find matching ruby methods' do
    # Arrange
    result = get('/Array/min')
    # Assert
    expect(result.split("\n")).to eq [
      'Content-Type: application/json',
      '',
      '["min","min_by","minmax","minmax_by"]'
    ]
  end

  def get(path)
    output = StringIO.new
    described_class.new(output: output).process_request(path)
    output.string
  end
end
