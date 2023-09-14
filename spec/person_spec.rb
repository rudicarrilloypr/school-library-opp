# spec/person_spec.rb
require_relative '../person'

RSpec.describe Person do
  describe '#can_use_services?' do
    context 'when the person is of age' do
      it 'returns true' do
        person = Person.new(name: 'Alice', age: 20)
        expect(person.can_use_services?).to eq(true)
      end
    end

    context 'when the person is not of age but has parent permission' do
      it 'returns true' do
        person = Person.new(name: 'Bob', age: 16, parent_permission: true)
        expect(person.can_use_services?).to eq(true)
      end
    end

    context 'when the person is not of age and has no parent permission' do
      it 'returns false' do
        person = Person.new(name: 'Charlie', age: 15, parent_permission: false)
        expect(person.can_use_services?).to eq(false)
      end
    end
  end
end
