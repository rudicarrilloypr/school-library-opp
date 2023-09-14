# spec/person_spec.rb
require_relative '../person'

RSpec.describe Person do
  describe Person do
    let(:person) { Person.new(20, 'John Doe') }

    describe '#initialize' do
      it 'creates a person with age, name, and default parent permission' do
        expect(person.age).to eq(20)
        expect(person.name).to eq('John Doe')
        expect(person.instance_variable_get(:@parent_permission)).to be_truthy
      end

      it 'has an id' do
        expect(person.id).not_to be_nil
      end

      it 'initializes rentals as an empty array' do
        expect(person.rentals).to be_empty
      end
    end

    describe '#can_use_services?' do
      it 'returns true if person is of age' do
        person = Person.new(18, 'Jane Doe')
        expect(person.can_use_services?).to be_truthy
      end

      it 'returns true if parent permission is granted' do
        person = Person.new(16, 'Johnny Doe', parent_permission: true)
        expect(person.can_use_services?).to be_truthy
      end

      it 'returns false if neither of age nor parent permission is granted' do
        person = Person.new(16, 'Johnny Doe', parent_permission: false)
        expect(person.can_use_services?).to be_falsey
      end
    end

    describe '#correct_name' do
      it 'returns the correct name' do
        expect(person.correct_name).to eq('John Doe')
      end
    end

    describe '#to_h' do
      it 'returns a hash representation of the person' do
        expected_hash = {
          id: person.id,
          name: 'John Doe',
          age: 20,
          parent_permission: true,
          rentals: []
        }
        expect(person.to_h).to eq(expected_hash)
      end
    end
  end
end
