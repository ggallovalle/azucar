RSpec.describe Azucar do
  it "has a version number" do
    expect(described_class::VERSION).not_to be nil
  end
end

RSpec.describe RSpec::Core::DSL do
  it 'responds to #top_level' do
    expect(described_class).to respond_to(:top_level)
  end
end

RSpec.describe "expectations and matchers" do
  # NOTE predicate matchers
  # instead of expect(0.zero?).to eq(0)
  # do expect(0).to be_zero
  # behind the scenes rspec calls the method zero? on the expectation
  # https://relishapp.com/rspec/rspec-expectations/v/3-10/docs/built-in-matchers/predicate-matchers
  context Integer do
    context 0 do
      it 'is zero' do
        expect(subject).to be_zero
      end

      it { is_expected.to be_zero }

      class Integer
        def multiple_of?(x)
          (self % x).zero?
        end
      end
      # NOTE pass arguments to matcher
      context 12 do
        it { is_expected.to be_multiple_of(4) }
      end
    end
  end

  context Hash do
    # NOTE Alternately, for a predicate method that begins with has_ like Hash#has_key?, RSpec allows
    #   you to use an alternate form since be_has_key makes no sense. 
    #   - calling private methods will also fail
    subject(:dict) { {foo: 'foo', bar: 'bar'} }
    it "has 'foo' key" do
      expect(dict).to have_key(:foo)
    end
  end
end
