# spec/student_spec.rb
require_relative '../person'
require_relative '../student'
require_relative '../classroom'

RSpec.describe Student do
  describe Student do
    let(:classroom) { Classroom.new('10A') }
    let(:student) { Student.new(age: 16, classroom: classroom, name: 'John Doe') }

    describe '#initialize' do
      it 'creates a student with age, classroom, name, and default parent permission' do
        expect(student.age).to eq(16)
        expect(student.classroom).to eq(classroom)
        expect(student.name).to eq('John Doe')
        expect(student.instance_variable_get(:@parent_permission)).to be_truthy
      end

      it 'adds the student to the classroom if not already included' do
        expect(classroom.students).to include(student)
      end
    end

    describe '#play_hooky' do
      it 'returns a string for playing hooky' do
        expect(student.play_hooky).to eq('¯\\(ツ)/¯')
      end
    end

    describe '#to_h' do
      it 'returns a hash representation of the student' do
        expected_hash = {
          id: student.id,
          name: 'John Doe',
          age: 16,
          parent_permission: true,
          classroom: '10A',
          rentals: []
        }
        expect(student.to_h).to eq(expected_hash)
      end
    end
  end
end
