require 'azucar/inheritance'

RSpec.describe Azucar::Inheritance do
  # NOTE instead of Azucar::Inheritance::A, use 'described_class'
  #   https://github.com/rspec/rspec-core#described_class
  #   described_class === example.metadata[:described_class]

  # NOTE instead of making an instance of the 'described class'
  #   use 'subject' wich is the same

  # NOTE prefer the use of 'named explicit subjects' as it improves
  #   because it provides an aditional memoized helper method, and also
  #  - the `subject` defined in an outer group is available to inner groups 
  #  - the subject is available in before groups
  # https://relishapp.com/rspec/rspec-core/v/3-10/docs/subject/explicit-subject
  context described_class::A do
    context '#sum' do
      subject { described_class.new.sum(1) }
      it 'returns the first argument value' do
        expect(subject).to eq(1) 
      end

      # NOTE one liner syntax, this can be used when the doc string and the
      #   example mirror each other
      # This is not the case right here, this is the WRONG usage of the feature
      # https://relishapp.com/rspec/rspec-core/v/3-10/docs/subject/one-liner-syntax
      it { is_expected.to eq(1) }
      it { should eq(1) }
    end
  end

  context described_class::B do
    it 'calls super with same argument' do
      # see https://stackoverflow.com/a/15857623/11621695
      # you shouldn't test super, instead figure out the behaviour if super is not called
      expect(subject.sum(1)).to eq(2)
    end

  end
end