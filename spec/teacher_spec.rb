require_relative '../teacher'
require_relative '../person'

RSpec.describe Teacher do
  describe Teacher do
    let(:teacher) { Teacher.new(30, 'Mathematics', 'Jane Doe') }

    describe '#initialize' do
      it 'creates a teacher with age, specialization, name, and default parent permission' do
        expect(teacher.age).to eq(30)
        expect(teacher.name).to eq('Jane Doe')
        expect(teacher.instance_variable_get(:@parent_permission)).to be_truthy
      end

      it 'has specialization' do
        expect(teacher.instance_variable_get(:@specialization)).to eq('Mathematics')
      end
    end

    describe '#can_use_services?' do
      it 'returns true for teachers' do
        expect(teacher.can_use_services?).to be_truthy
      end
    end

    describe '#to_h' do
      it 'returns a hash representation of the teacher' do
        expected_hash = {
          id: teacher.id,
          name: 'Jane Doe',
          age: 30,
          parent_permission: true,
          specialization: 'Mathematics'
        }
        expect(teacher.to_h).to eq(expected_hash)
      end
    end
  end
end
