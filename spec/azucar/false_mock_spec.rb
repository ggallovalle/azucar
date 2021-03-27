RSpec.describe Azucar::FalseMocks do
  context described_class::Controller do
    describe '#get' do
      context 'pass model interface as argument' do
        it 'with doubles and allow' do
          # Arrange
          model = instance_double('Azucar::FalseMocks::Model')
          allow(model).to receive(:errors)
          # Act
          subject.get(model)
          # Assert
          expect(model).to have_received(:errors)
        end

        it 'with double and expect in Arrange' do
          # Arrange
          model = instance_double('Azucar::FalseMocks::Model')
          expect(model).to receive(:errors)
          # Act
          subject.get(model)
          # Assert
        end

        it 'with spy' do
          # Arrange
          model = instance_spy(Azucar::FalseMocks::Model)
          # Act
          subject.get(model)
          # Assert
          expect(model).to have_received(:errors)
        end


        it 'Model#errors has receive' do
          expect_any_instance_of(Azucar::FalseMocks::Model).to receive(:errors)
          subject.get
        end

      end

      context 'default model as argument' do
        subject { described_class.new.get }

        it {
          model_errors = Azucar::FalseMocks::Model.new.errors
          is_expected.to eq(model_errors)
        }

        it 'should return the same as Model#errors' do
          # Arrange
          model_errors = Azucar::FalseMocks::Model.new.errors
          # Act
          # Assert
          expect(subject).to eq(model_errors)
        end
      end
    end
  end
end