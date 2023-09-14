require_relative '../nameable'
require_relative '../decorator'
require_relative '../person'

RSpec.describe Decorator do
  person = Person.new(name: 'Bob', age: 23, parent_permission: true)

  describe '#correct_name' do
    it 'returns the correct name from the wrapped nameable object' do
      decorator = Decorator.new(person)

      expect(decorator.correct_name).to eq('Bob')
    end
  end
end
