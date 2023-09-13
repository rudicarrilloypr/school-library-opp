require_relative '../decorator'
require_relative '../nameable'
require_relative '../person'

RSpec.describe Decorator do
  describe Decorator do
    let(:nameable) { double('nameable', correct_name: 'Original Name') }
    let(:decorator) { Decorator.new(nameable) }

    describe '#initialize' do
      it 'initializes with a nameable object' do
        expect(decorator.nameable).to eq(nameable)
      end
    end

    describe '#correct_name' do
      it 'delegates the correct_name method to the nameable object' do
        expect(decorator.correct_name).to eq('Original Name')
      end
    end
  end
end
